require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'pry'
require './lib/shoe'
require './lib/store'
also_reload( './lib/**/*.rb')

get '/' do
  @shoes = Shoe.all
  @stores = Store.all
  erb :index
end

post '/add_shoe' do
  Shoe.create( {name: params.fetch("shoe_name"), cost: params.fetch("shoe_cost")} )
  redirect '/'
end

post '/add_store' do
  Store.create( {name: params.fetch("store_name"), zipcode: params.fetch("store_zip")} )
  redirect '/'
end
