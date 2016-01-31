class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :customer
      t.string :state
      t.decimal :price

      t.timestamps null: false
    end
  end
end
