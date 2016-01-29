require 'spec_helper'

describe Shoe do
  describe "#new" do
    it 'creates a new shoe with name and cost' do
      new_shoe = Shoe.create( {name: "Nike", cost: 199} )
      expect(new_shoe.name).to(eq("Nike"))
      expect(new_shoe.cost).to(eq(199))
    end
  end
  describe ".capitalize_store_name" do
    it 'creates new shoe and checks name is capitalized' do
      new_shoe = Shoe.create( {name: "addidas", cost: 0} )
      expect(new_shoe.name).to(eq("Addidas"))
    end
  end
end
