
require 'spec_helper'
require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set :show_exceptions, false

feature 'add a store' do
  scenario 'allows user to add a store' do
    visit '/'
    fill_in 'store_name', with: 'franks shoe store'
    fill_in 'store_zip', with: '34234'
    click_button 'Add Store'
    expect(page).to have_content 'Franks Shoe Store'
  end
end

feature 'add a shoe' do
  scenario 'allows user to add a shoe brand' do
    visit '/'
    fill_in 'shoe_name', with: "addidas"
    fill_in 'shoe_cost', with: "99"
    click_button 'Add Shoe'
    expect(page).to have_content 'Addidas'
  end

end
