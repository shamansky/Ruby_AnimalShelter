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
      sql = "DELETE FROM houses"
      SqlRunner.run(sql)
    end

    def delete()
      sql = "DELETE FROM houses WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM houses"
      results = SqlRunner.run(sql)
      return results.map {|house| House.new(house)}
    end

    def self.find(id)
      sql = "SELECT * FROM houses WHERE id = $1"
      values = [id]
      house =  SqlRunner.run(sql, values)[0]
      return House.new(house)
    end

    def students()
      sql = "SELECT * FROM students WHERE house_id = $1"
      values = [@id]
      students = SqlRunner.run(sql, values)
      return students.map{|student| Student.new(student)}
    end



end
