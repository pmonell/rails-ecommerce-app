FactoryGirl.define do
  factory :order do
    association :customer, factory: :customer
  end
end
