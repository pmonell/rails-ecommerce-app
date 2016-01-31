class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :unit_price, numericality: { greater_than_or_equal_to: 0.0 }, presence: true

  has_many :order_items
end
