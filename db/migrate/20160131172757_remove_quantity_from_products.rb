class RemoveQuantityFromProducts < ActiveRecord::Migration
  def change
    rename_column :products, :price, :unit_price
    remove_column :products, :quantity
  end
end
