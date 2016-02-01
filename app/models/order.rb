class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :order_items
  has_many :products, through: :order_items

  before_create :set_order_status
  before_save :update_price

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def build_order_items_with_product_ids_and_quantities(product_ids_and_quantities)
    product_ids_and_quantities.each do |product_id_and_quantity|
      id, quantity = product_id_and_quantity
      self.order_items.build(product_id: id, quantity: quantity)
    end
  end

  private

    def set_order_status
      self[:status] = "pending"
    end

    def update_price
      self[:price] = subtotal
    end
end
