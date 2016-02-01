require 'rails_helper'

RSpec.describe ProductInventory, type: :model do
  let(:product_inventory) { FactoryGirl.build :product_inventory }

  subject { product_inventory }

  it { should respond_to(:stock) }

  it { should validate_numericality_of(:stock).is_greater_than_or_equal_to(0) }
end
