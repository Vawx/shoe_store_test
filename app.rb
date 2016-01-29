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

get '/store_page/:id' do
  @store = Store.find(params[:id])
  erb :store_page
end

post '/add_shoe' do
  Shoe.create( {name: params.fetch("shoe_name"), cost: params.fetch("shoe_cost")} )
  redirect '/'
end

post '/add_store' do
  Store.create( {name: params.fetch("store_name"), zipcode: params.fetch("store_zip")} )
  redirect '/'
end

patch '/update_store/:id' do
  update_store = Store.find(params[:id])
  new_name = params.fetch("store_name")
  new_zip = params.fetch("store_zip")
  if new_name.length > 0
    update_store.update({name: params.fetch("store_name")})
  end
  if new_zip.length > 0
    update_store.update({zipcode: params.fetch("store_zip")})
  end
  redirect '/store_page/' + params[:id].to_s
end
