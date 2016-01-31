class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.0 }, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }, presence: true

end
