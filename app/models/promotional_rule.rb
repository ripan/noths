class PromotionalRule < ActiveRecord::Base
  belongs_to :product
  validates :discount_price, numericality: {:greater_than => 0}
  #validate :discount_cannot_be_greater_than_total_value
  #validate :discount_percentage_cannot_be_greater_than_total_value

  def discount_cannot_be_greater_than_total_value
    if discount_price > product.price
      errors.add(:discount_price, "can't be greater than total value")
    end
  end

  def discount_percentage_cannot_be_greater_than_total_value
    if discount_percentage > 100
      errors.add(:discount_percentage, "can't be greater than 100%(total value)")
    end
  end
end
