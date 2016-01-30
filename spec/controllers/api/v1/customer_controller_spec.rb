require 'rails_helper'

RSpec.describe Api::V1::CustomerController, type: :controller do

  describe "GET #index" do
    before(:each) do
      @user1 = FactoryGirl.create :customer
      @user2 = FactoryGirl.create :customer
      get :index
    end
    
    it "returns json of users containing customers key" do
      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(json_response).to have_key(:customers)
    end

    it "returns json of users containing all users and their attributes" do
      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(json_response['customers']).to eql [@user1, @user2]
    end
  end
  
end
