class DropStoresShoes < ActiveRecord::Migration
  def change
    drop_table :stores_shoes
  end
end
