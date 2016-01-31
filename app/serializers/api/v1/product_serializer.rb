class Api::V1::ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price
end
