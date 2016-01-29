class UpdateShoesStores < ActiveRecord::Migration
  def change
    remove_column :stores_shoes, :shoe_id, :int
    remove_column :stores_shoes, :store_id, :int
    create_table :shoes_stores do |ss|
      ss.column :shoe_id, :int
      ss.column :store_id, :int
    end
  end
end
