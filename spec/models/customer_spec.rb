require 'rails_helper'

RSpec.describe Customer, type: :model do
  before { @customer = FactoryGirl.build(:customer) }

  subject { @customer }

  it { should respond_to(:email) }
end
