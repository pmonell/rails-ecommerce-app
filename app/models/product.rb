class Product < ActiveRecord::Base
  has_one :product_inventory
  has_many :order_items

  validates :name, presence: true
  validates :unit_price, numericality: { greater_than_or_equal_to: 0.0 }, presence: true
  validates_associated :product_inventory, :on => :create

  attr_accessor :stock
  
  before_create :set_inventory

  def decrement_inventory!(quantity)
    self.product_inventory.decrement!(:quantity, quantity)
  end

  private

  def set_inventory
    build_product_inventory(stock: stock)
  end
end
