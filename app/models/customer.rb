class Customer < ActiveRecord::Base
  validates :email, presence: true
  has_many :orders
  has_many :products through :orders
end
