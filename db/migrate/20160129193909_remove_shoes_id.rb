class RemoveShoesId < ActiveRecord::Migration
  def change
    remove_column :shoes, :store_id, :int
  end
end
