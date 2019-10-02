require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative("./models/pizza_order")
also_reload("./models/*")

# INDEX

get "/pizza-orders" do
  @orders = PizzaOrder.all()
  erb( :index )
end

# NEW

get "/pizza-orders/new" do
  erb( :new )
end

post "/pizza-orders" do
  @order = PizzaOrder.new(params)
  @order.save()
  erb( :create )
end


# SHOW

get "/pizza-orders/:id" do
  @order = PizzaOrder.find( params["id"] )
  erb( :show )
end

# DELETE

post "/pizza-orders/:id/delete" do
  order = PizzaOrder.find(params["id"])
  order.delete()
  redirect to("/pizza-orders")
end


# EDIT

get "/pizza-orders/:id/edit" do
  @order = PizzaOrder.find(params["id"])
  erb(:edit)
end

# UPDATE

post "/pizza-orders/:id" do
  @order = PizzaOrder.find(params["id"])
  @order.update()
  redirect to("/pizza-orders")
end
