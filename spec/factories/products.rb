FactoryGirl.define do
  factory :product do
    name { FFaker::Product.product_name }
    description { FFaker::Product.product }
    unit_price { rand() * 10 }
  end
end
