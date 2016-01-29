ENV['RACK_ENV'] = 'test'

require 'sinatra/activerecord'
require 'rspec'
require 'pg'
require 'shoe'
require 'store'
require 'pry'

RSpec.configure do |config|
  config.after :each do
    Shoe.all.each do |r|
      r.destroy
    end
    Store.all.each do |s|
      s.destroy
    end
  end
end
