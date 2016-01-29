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
  @store_shoes = @store.shoes
  @shoes = Shoe.all
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

patch '/add_shoe_to_store/:store_id/:shoe_id' do
  store = Store.find(params[:store_id])
  shoe = Shoe.find(params[:shoe_id])
  found = false
  store.shoes.each do |s|
    if s.name == shoe.name
      found = true
    end
  end
  if !found
    store.shoes.push(shoe)
  end
  redirect '/store_page/' + store.id.to_s
end

delete '/delete_shoe_from_store/:store_id/:shoe_id' do
  store = Store.find(params[:store_id])
  shoe = Shoe.find(params[:shoe_id])
  store.shoes.delete(shoe)
  redirect '/store_page/' + store.id.to_s
end
