50.times do |i|
  customer = FactoryGirl.create :customer
  product = FactoryGirl.create :product, :stock => rand(20) + 200
end

25.times do |i|
  order_item = FactoryGirl.create :order_item, product_id: rand(40) + 1
  order_item2 = FactoryGirl.create :order_item, product_id: rand(40) + 1
  order = FactoryGirl.create :order, customer_id: i, :order_items => [order_item, order_item2]
end
