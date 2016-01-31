class Api::V1::OrderSerializer < ActiveModel::Serializer
  attributes :id, :price, :status

  has_many :order_items, each_serializer: Api::V1::OrderItemSerializer
end
