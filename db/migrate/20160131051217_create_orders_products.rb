class CreateOrdersProducts < ActiveRecord::Migration
  def change
    create_table :orders_products, id: false do |t|
      t.belongs_to :orders, index: true
      t.belongs_to :products, index: true
    end
  end
end
