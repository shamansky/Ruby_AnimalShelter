require_relative('./pet.rb')
require_relative('../db/sql_runner.rb')

class Owner

attr_reader :id
attr_accessor :first_name, :last_name, :age, :location

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i()
    @location = options['location']
  end

  def pretty_name_owner()
      return "#{@first_name} #{@last_name}"
    end

  def save()
      sql = "INSERT INTO owners (first_name, last_name, age, location) VALUES ($1, $2, $3, $4) RETURNING id"
      values = [@first_name, @last_name, @age, @location]
      result = SqlRunner.run(sql, values)
      @id = result[0]["id"]
    end

    def update()
      sql = "UPDATE owners SET (first_name, last_name, age, location) = ($1, $2, $3, $4) WHERE id = $5"
      values = [@first_name, @last_name, @age, @location, @id]
      SqlRunner.run(sql, values)
    end

    def self.delete_all()
      sql = "DELETE FROM owners"
      SqlRunner.run(sql)
    end

    def delete()
      sql = "DELETE FROM owners WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM owners"
      results = SqlRunner.run(sql)
      return results.map {|owner| Owner.new(owner)}
    end

    def self.find(id)
      sql = "SELECT * FROM owners WHERE id = $1"
      values = [id]
      owner =  SqlRunner.run(sql, values)[0]
      return Owner.new(owner)
    end

    def pets()
      sql = "SELECT * FROM pets WHERE owner_id = $1"
      values = [@id]
      pets = SqlRunner.run(sql, values)
      return pets.map{|pet| Pet.new(pet)}
    end



end
