class ShoesJoinStores < ActiveRecord::Migration
  def change
    create_table :stores_shoes do |ss|
      ss.column :shoe_id, :int
      ss.column :store_id, :int
    end
  end
end
