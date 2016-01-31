class Customer < ActiveRecord::Base
  validates :email, presence: true
  has_many :orders
  has_many :order_items, through: :orders
end
