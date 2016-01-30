class Api::V1::CustomerSerializer < ActiveModel::Serializer
  attributes :email, :first_name, :last_name
end
