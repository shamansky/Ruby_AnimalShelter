require_relative('./owner.rb')
require_relative('../db/sql_runner.rb')

class Pet

attr_reader :id, :owner_id
attr_accessor :name, :nickname, :age, :admission_date, :adoptability, :species, :breed

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @nickname = options['nickname']
  @owner_id = options['owner_id'].to_i()
  @age = options['age'].to_i()
  @admission_date = options['admission_date']
  @adoptability = options['adoptability']
  @species = options['species']
  @breed = options['breed']
end

def pretty_name_pet()
    return "#{@name} #{@nickname}"
  end

  def save()
    sql = "INSERT INTO pets (name, nickname, age, admission_date, adoptability, species, breed, owner_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id"
    values = [@name, @nickname, @age, @admission_date, @adoptability, @species, @breed, @owner_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id']
  end

  def update()
    sql = "UPDATE pets SET (name, nickname, age, admission_date, adoptability, species, breed, owner_id) = ($1, $2, $3, $4, $5, $6, $7, $8) WHERE id = $9"
    values = [@name, @nickname, @age, @admission_date, @adoptability, @species, @breed, @owner_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM pets"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM pets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM pets"
    results = SqlRunner.run(sql)
    pets = results.map{|pet_hash| Pet.new(pet_hash)}
    return pets
  end

  def self.find(id)
    sql = "SELECT * FROM pets WHERE id = $1"
    values = [id]
    pet_hash = SqlRunner.run(sql, values).first()
    return Pet.new(pet_hash)
  end

  def owner()
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [@owner_id]
    result = SqlRunner.run(sql, values)[0]
    return Owner.new(result)
  end



end
