class AddShoeStores < ActiveRecord::Migration
  def change
    create_table :stores do |s|
      s.column :name, :string
      s.column :zipcode, :int
    end
  end
end
