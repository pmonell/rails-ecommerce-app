require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { FactoryGirl.build :product }

  subject { product }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:unit_price) }

  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:unit_price).is_greater_than_or_equal_to(0.0) }
end
