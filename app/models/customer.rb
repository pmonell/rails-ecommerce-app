class Customer < ActiveRecord::Base
  validates_format_of :email, :with => /@/, presence: true
  has_many :orders
  has_many :order_items, through: :orders
end
