class AddShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |s|
      s.column :name, :string
      s.column :cost, :int
    end
  end
end
