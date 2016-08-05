class Cart < ActiveRecord::Base
  attr_accessor :total_after_discount
  belongs_to :user
  has_many :carts_products
  has_many :products, through: :carts_products

  def scan(product)
    products << product
  end

  def total
    products.sum('price')
  end

  def apply_promotional_rules(all_promotional_rules)

    discount = 0
    discounted_price = total

    all_promotional_rules[:promotional_rules].each do |promotional_rule|
      product = promotional_rule.product
      discounted_products = products.where(name:product.name)
      if discounted_products.length >= promotional_rule.quantity
        discount = discount + ((discounted_products.first.price - promotional_rule.discount_price) * discounted_products.length)
        discounted_price = discounted_price - discount
      end
    end
    # discounted_products = products.where(name:'Travel Card Holder')
    # if discounted_products.length >= 2
    #   discount = discount + ((discounted_products.first.price - 8.50) * discounted_products.length)
    #   discounted_price = discounted_price - discount
    # end


    all_promotional_rules[:misc_promotional_rules].each do |misc_promotional_rule|
      if (total > misc_promotional_rule.discount_price)
        discount = (total * misc_promotional_rule.discount_percentage/100)
        discounted_price = discounted_price - discount
      end
    end
    # if (total > 60)
    #   discount = (total * 10/100)
    #   discounted_price = discounted_price - discount
    # end

    @total_after_discount = discounted_price
  end

  def discount_percentage
    ((total - @total_after_discount)/total * 100)
  end

end
