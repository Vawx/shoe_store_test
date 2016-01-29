class AddShoesId < ActiveRecord::Migration
  def change
    add_column :shoes, :store_id, :int
  end
end
