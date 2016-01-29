require 'spec_helper'

describe Shoe do
  describe "#new" do
    it 'creates a new shoe with name and cost' do
      new_shoe = Shoe.create( {name: "Nike", cost: 199} )
      expect(new_shoe.name).to(eq("Nike"))
      expect(new_shoe.cost).to(eq(199))
    end
  end
  describe ".capitalize_shoe_name" do
    it 'creates new shoe and checks name is capitalized' do
      new_shoe = Shoe.create( {name: "addidas", cost: 0} )
      expect(new_shoe.name).to(eq("Addidas"))
    end
  end
  describe "#validate" do
    it 'validates name exists before saving shoe' do
      new_shoe = Shoe.create( {name: "", cost: 0} )
      expect(new_shoe.save).to(eq(false))
    end
  end
  describe "many_to_many" do
    it 'belongs to many stores' do
      new_shoe = Shoe.create( {name: "nike", cost: 199} )
      store_1 = Store.create( {name: "Shoe Barn", zipcode: 94834} )
      store_2 = Store.create( {name: "Shoe Outlet", zipcode: 34224} )
      new_shoe.stores.push( store_1 )
      new_shoe.stores.push( store_2 )
      expect(new_shoe.stores).to(eq([store_1, store_2]))
    end
  end
end
