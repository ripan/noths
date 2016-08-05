require 'rails_helper'

RSpec.describe Cart, :type => :model do
  describe "validations" do
    it { should belong_to(:user) }
    it { should have_many(:carts_products) }
    it { should have_many(:products).through(:carts_products) }
  end

  describe "with items" do
    let(:user){ FactoryGirl.create(:user)}
    let(:cart){ FactoryGirl.create(:cart, user: user)}

    let(:product1){ FactoryGirl.create(:product, name: 'Travel Card Holder', price:9.25) }
    let(:product2){ FactoryGirl.create(:product, price:45.00) }
    let(:product3){ FactoryGirl.create(:product, price:19.95) }

    let(:misc_promotional_rule){ FactoryGirl.create(:misc_promotional_rule, name: "Cart", discount_percentage: 10, discount_price: 60) }
    let(:promotional_rule){ FactoryGirl.create(:promotional_rule, quantity: 2, discount_price:8.50, product: product1 ) }

    it "should have total equal to sum of items in the cart" do
      cart.scan(product1)
      cart.scan(product2)
      cart.scan(product3)
      expect(cart.total).to eq(74.2)
    end

    it "should get no discount if spend is under £60" do
      cart.scan(product1)
      cart.scan(product2)
      expect(cart.total).to eq(54.25)
    end

    it "should get 10% off the purchase if spend is over £60 and selected product has promotional rule on it" do
      cart.scan(product1)
      cart.scan(product1)
      cart.scan(product2)
      cart.scan(product3)
      # Before Discount
      # 9.45 * 2 + 45.00 + 19.95 = 83.45
      # After Discount
      # 8.50 * 2 + 45.00 + 19.95 = 81.95
      # 81.95 * 10/100 = 8.195
      # 81.95 - 8.195 = 73.755
      all_promotional_rules = {misc_promotional_rules: [misc_promotional_rule], promotional_rules: [promotional_rule]}
      cart.apply_promotional_rules(all_promotional_rules)

      expect(cart.total).to eq(83.45)
      expect(cart.total_after_discount.round(0)).to eq(73.76.round(0))
    end

    it "should get price drop to £8.50 on Travel Card Holders if 2 or more are purchased" do

    end
  end


end
