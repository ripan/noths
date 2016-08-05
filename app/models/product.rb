class Product < ActiveRecord::Base
  attr_accessor :discounted_price	
  validates :code, uniqueness: true
  validates :name, :code, :description, :price,  presence: true
  validates :price, numericality: {:greater_than => 0}

  has_many :carts_products
  has_many :carts, through: :carts_products
  has_many :promotional_rules
end
