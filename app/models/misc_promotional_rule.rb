class MiscPromotionalRule < ActiveRecord::Base
  validates :name, presence:true, uniqueness: true
  validates :discount_price, numericality: {:greater_than => 0}
end
