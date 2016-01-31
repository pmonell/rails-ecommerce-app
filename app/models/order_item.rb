class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }, presence: true
  #validate :order_present

  def unit_price
    return product[:unit_price]
  end

  def total_price
    product[:unit_price] * quantity
  end

private

  def order_present
    if order.nil?
      errors.add(:order, "is invalid")
    end
  end

end
