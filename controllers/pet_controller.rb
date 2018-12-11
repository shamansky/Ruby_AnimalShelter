require_relative('../models/pet')
require_relative('../models/owner')

get '/pets' do
  @pets = Pet.all
  erb(:"pets/index")
end

get '/pets/new' do
  @owners = Owner.all
  erb(:"pets/new")
end

post '/pets' do
  Pet.new(params).save
  redirect to '/pets'
end

get '/pets/:id' do
  @pet = Pet.find(params['id'])
  erb(:"pets/show")
end

post '/pets/:id' do
  pet = Pet.new(params)
  pet.update
  redirect to "/pets/#{params['id']}"
end

post '/pets/:id/delete' do
  pet = Pet.find(params['id'])
  pet.delete
  redirect to '/pets'
end

get '/pets/:id/edit' do
  @owners = Owner.all
  @pet = Pet.find(params['id'])
  erb(:"pets/edit")
end
