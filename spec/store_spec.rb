require 'spec_helper'

describe Store do
  describe "#new" do
    it 'creates a new store with name and cost' do
      new_store = Store.create( {name: "Mikes Bargin Shoe", zipcode: 14299} )
      expect(new_store.name).to(eq("Mikes Bargin Shoe"))
      expect(new_store.zipcode).to(eq(14299))
    end
  end
  describe ".capitalize_store_name" do
    it 'creates new store and checks name is capitalized' do
      new_store = Store.create( {name: "franks bucket o shoes", zipcode: 34230} )
      expect(new_store.name).to(eq("Franks Bucket O Shoes"))
    end
  end
  describe "#validate" do
    it 'validates name exists before saving store' do
      new_store = Store.create( {name: "", zipcode: 23420} )
      expect(new_store.save).to(eq(false))
    end
  end
  describe "many_to_many" do
    it 'belongs to many stores' do
      new_store = Store.create( {name: "big wall of shoes", zipcode: 32199} )
      shoe_1 = Shoe.create( {name: "Nike", cost: 94} )
      shoe_2 = Shoe.create( {name: "Outlet Shoe", cost: 34} )
      new_store.shoes.push( shoe_1 )
      new_store.shoes.push( shoe_2 )
      expect(new_store.shoes).to(eq([shoe_1, shoe_2]))
    end
  end
end
