require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { FactoryGirl.build :product }

  subject { product }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:price) }
  it { should respond_to(:quantity) }

  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.0) }
  it { should validate_numericality_of(:quantity).is_greater_than_or_equal_to(0) }
end
