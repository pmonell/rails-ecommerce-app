require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "#with_order_items" do
    before(:each) do
      @order = Order.new
      @oi = FactoryGirl.build :order_item
      @order.order_items << @oi
      @order.save
    end

    it "finds associated order item" do
      expect(@order.order_items.first[:quantity]).to eq(@oi.quantity)
    end

    it "reflects price of order item" do
      expect(@order.price).to eql(@oi.total_price)
    end

    it "updates price when new order item is added" do
      oi2 = FactoryGirl.build :order_item
      @order.order_items << oi2
      @order.save
      expect(@order.price).to eq(oi2.total_price + @oi.total_price)
    end
  end
end
