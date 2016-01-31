require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :controller do
  describe "GET #show" do
    before(:each) do
      @order = FactoryGirl.create :order
      4.times { FactoryGirl.create :order_item, order: @order }
      get :show, id: @order.id
    end
    
    it "returns json with root being the order id" do
      expect(json_response).to have_key(:order)
    end

    it "returns json with 5 order items embeded" do
      expect(json_response[:order].length).to eq(4)
    end
  end
end
