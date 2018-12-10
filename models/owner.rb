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




end
