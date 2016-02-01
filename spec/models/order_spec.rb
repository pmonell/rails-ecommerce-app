require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "#with_order_items" do
    before(:each) do
      @order = Order.new
      @oi = FactoryGirl.build :order_item
      @order.order_items << @oi
      @order.set_total!
    end

    it "finds associated order item" do
      expect(@order.order_items.first[:quantity]).to eq(@oi.quantity)
    end

    it "reflects price of order item" do
      expect(@order[:price]).to eql(@oi.total_price)
    end

    it "updates price when new order item is added" do
      oi2 = FactoryGirl.build :order_item
      @order.order_items << oi2
      @order.set_total!
      expect(@order.price).to eq(oi2.total_price + @oi.total_price)
    end
  end

  describe "#building_orders_items_with_product_ids_and_quantities" do
    before do
      @order = FactoryGirl.create :order
      product_1 = FactoryGirl.build :product, unit_price: 50.0, stock: 50
      product_2 = FactoryGirl.build :product, unit_price: 10.0, stock: 50

      @product_ids_and_quantities = [[product_1.id, 2], [product_2.id, 5]]
    end

    it "builds two order items for the order" do
      expect{@order.build_order_items_with_product_ids_and_quantities(@product_ids_and_quantities)}.to change{@order.order_items.size}.from(0).to(2)
    end
  end

  describe "#valid stock available" do
    before do
      product_1 = FactoryGirl.build :product, unit_price: 50.0, stock: 10
      product_2 = FactoryGirl.build :product, unit_price: 10.0, stock: 2
      
      product_1.set_initial_inventory
      product_2.set_initial_inventory

      @order = FactoryGirl.build :order

      order_item_1 = FactoryGirl.build :order_item, product: product_1, quantity: 15
      order_item_2 = FactoryGirl.build :order_item, product: product_2, quantity: 3

      @order.order_items << order_item_1
      @order.order_items << order_item_2
    end

    it "is invalid due to insufficient inventory" do
      expect(@order).to_not be_valid
    end
  end
end
