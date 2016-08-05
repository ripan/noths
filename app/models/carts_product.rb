class CartsProduct < ActiveRecord::Base
	#validates :quantity, numericality: true
	belongs_to :product
	belongs_to :cart

  def get_discounted_product_price(quantity,product)
    if quantity > 1
      pr = PromotionalRule.find_by_product_id(product.id)
      price = pr.blank? ? product.price : pr.discount_price
    else
      price = product.price
    end
    return price
  end

  
	def item_price_by_quantity
		self.quantity * self.product.price
	end
end
