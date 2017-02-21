require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza.rb')


# INDEX - READ - all

get '/pizzas' do
  @pizzas = Pizza.all()
  erb(:index)
end

# NEW - CREATE - get form

get '/pizzas/new' do
  erb(:new)
end

# SHOW - READ - find by ID

get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb(:show)
end

# CREATE - CREATE - submit form

post '/pizzas' do
  @pizza = Pizza.new(params)
  @pizza.save
  erb(:create)
end

# EDIT - UPDATE - create form

get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params[:id])
  erb(:edit)
end

# UPDATE - UPDATE - submit form

post '/pizzas/:id' do
  pizza = Pizza.new(params)
  pizza.update
  redirect to "pizzas/#{pizza.id}"
end

# DESTROY - DELETE

post '/pizzas/:id/delete' do
  pizza = Pizza.find(params[:id])
  pizza.delete() 
  redirect to '/pizzas'
end
