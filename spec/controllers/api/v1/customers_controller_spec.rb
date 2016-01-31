require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do

  describe "GET #index" do
    before(:each) do
      @user1 = FactoryGirl.create :customer
      @user2 = FactoryGirl.create :customer
      get :index, format: :json
    end
    
    it "returns json of users containing customers key" do
      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(json_response).to have_key(:customers)
    end

    it "returns json of users containing all users and their attributes" do
      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(json_response[:customers].length).to eql 2
    end
  end

  describe "POST #create" do
    
    context "successful customer creation" do
      before(:each) do
        @customer_attributes = FactoryGirl.attributes_for :customer
        post :create, { customer: @customer_attributes }, format: :json
      end

      it "returns customer that was just created" do
        json_response = JSON.parse(response.body, symbolize_names: true)
        expect(json_response[:customer][:first_name]).to eql @customer_attributes[:first_name]
      end
    end

    context "invalid attributes" do
      before(:each) do
        @customer_invalid_attributes = { first_name: "hey", last_name: "bey" }
        post :create, { customer: @customer_invalid_attributes }, format: :json
      end

      it "returns errors json" do
        json_response = JSON.parse(response.body, symbolize_name: true)
        expect(json_response).to have_key(:errors)
      end
    end
  end
end
