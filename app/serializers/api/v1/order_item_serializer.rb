class Api::V1::OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :product_id
end
