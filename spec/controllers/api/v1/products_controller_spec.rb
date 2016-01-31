require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
  
  describe "GET #show" do
    before(:each) do
      @product = FactoryGirl.create :product
      get :show, id: @product.id
    end

    it "returns json with matching product" do
      expect(json_response[:product][:name]).to eq(@product.name)
    end
  end
  
  describe "GET #index" do
    before(:each) do
      5.times { FactoryGirl.create :product }
      get :index
    end

    it "returns json with product key" do
      expect(json_response).to have_key(:product)
    end

    it "returns 5 product records" do
      expect(json_response[:product].length).to eq(5)
    end
  end
end
