class CreateProductInventories < ActiveRecord::Migration
  def change
    create_table :product_inventories do |t|
      t.belongs_to :product
      t.integer :stock

      t.timestamps null: false
    end
  end
end
