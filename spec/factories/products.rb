FactoryGirl.define do
  factory :product do
    name { FFaker::Product.product_name }
    description { FFaker::Product.product }
    price { rand() * 10 }
    quantity { rand() * 100 }
  end
end
