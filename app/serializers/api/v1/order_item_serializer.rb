class Api::V1::OrderItemSerializer < ActiveModel::Serializer
  attributes :quantity, :sub_total
  has_one :product, serializer: Api::V1::ProductSerializer

  def sub_total
    object.total_price
  end
end
