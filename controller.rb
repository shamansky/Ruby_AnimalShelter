require('sinatra')
require('sinatra/contrib/all')

require_relative('./controllers/owner_controller.rb')
require_relative('./controllers/pet_controller.rb')
also_reload('./models/*')

get '/' do
  erb(:home)
end
