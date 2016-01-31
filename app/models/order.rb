class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :order_items
  has_many :products, through: :order_items

  before_create
  before_save :update_price

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

private

  def set_order_status
    self[:status] = "pending"
  end

  def update_price
    self[:price] = subtotal
  end

end
