require_relative('../models/pet')
require_relative('../models/owner')

get '/owners' do
  @owners = Owner.all
  erb(:"owners/index")
end

get '/owners/new' do
  @owners = Owner.all
  erb(:"owners/new")
end

post '/owners' do
  Owner.new(params).save
  redirect to '/owners'
end

get '/owners/:id' do
  @owner = Owner.find(params['id'])
  @pets = @owner.pets()
  erb(:"owners/show")
end
