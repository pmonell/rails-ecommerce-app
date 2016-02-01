class Product < ActiveRecord::Base
  attr_accessor :stock
  
  has_one :product_inventory
  has_many :order_items

  validates :name, presence: true
  validates :unit_price, numericality: { greater_than_or_equal_to: 0.0 }, presence: true
  validates_associated :product_inventory, :on => :create

  before_create :set_initial_inventory

  scope :filter_by_name, lambda { |keyword| where("lower(name) LIKE ?", "%#{keyword}%") }
  scope :below_price, lambda { |price| where("unit_price < ?", price) } 

  def decrement_inventory!(quantity)
    self.product_inventory.decrement!(:stock, quantity)
  end

  def quantity
    self.product_inventory[:stock]
  end

  def self.search(params = {})
    products = Product.all

    products = products.filter_by_name(params[:keywords]) if params[:keywords]
    products = products.below_price(params[:below_price]) if params[:below_price]

    products
  end

  def set_initial_inventory
    build_product_inventory(stock: stock)
  end
end
