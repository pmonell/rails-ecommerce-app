class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :order_items
  has_many :products, through: :order_items

  before_create :set_order_status
  before_validation :set_total!
  
  validates :customer_id, presence: true
  validates_with EnoughInventoryValidator

  def build_order_items_with_product_ids_and_quantities(product_ids_and_quantities)
    product_ids_and_quantities.each do |product_id_and_quantity|
      id, quantity = product_id_and_quantity
      self.order_items.build(product_id: id, quantity: quantity)
    end
  end

  def paid_for_order!
    self[:status] = "paid"
  end

  def set_total!
    self.price = 0
    order_items.each do |order_item|
      self.price += order_item.quantity * order_item.unit_price
    end
  end

  private

    def set_order_status
      self[:status] = "pending"
    end
end
