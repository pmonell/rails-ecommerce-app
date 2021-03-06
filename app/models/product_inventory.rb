class ProductInventory < ActiveRecord::Base
  belongs_to :product

  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
