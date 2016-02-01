require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe "#with_product_association" do
    it "updates total price when quantity is updated" do
      order = Order.new
      order_item = FactoryGirl.build :order_item
      order.order_items << order_item
      order_item[:quantity] = 1
      expect(order_item.total_price).to eq(1 * order_item.unit_price)
    end
  end
end
