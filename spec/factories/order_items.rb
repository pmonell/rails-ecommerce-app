FactoryGirl.define do
  factory :order_item do
    association :product, factory: :product
    quantity { rand(10) + 1 }
  end
end
