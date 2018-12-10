require_relative('./owner.rb')
require_relative('../db/sql_runner.rb')

class Pet

attr_reader :id, :owner_id
attr_accessor :name, :nickname, :age, :admission_date, :adoptability, :species, :breed

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @nickname = options['nickname']
  @owner_id = options['owner_id'].to_i() if options['owner_id']
  @age = options['age'].to_i()
  @admission_date = options['admission_date']
  @adoptability = options['adoptability']
  @species = options['species']
  @breed = options['breed']
end




end
