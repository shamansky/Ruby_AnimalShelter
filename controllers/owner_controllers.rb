require_relative('../models/pet')
require_relative('../models/owner')

get '/owners' do
  @owners = Owner.all
  erb(:"owners/index")
end

get '/owners/:id' do
  @owner = Owner.find(params['id'])
  @pets = @owner.pets()
  erb(:"owners/show")
end
