require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "validations" do
    it { should have_one(:cart) }
  end

  describe "with items in cart" do
    let(:user){ FactoryGirl.create(:user)}
    let(:cart){ FactoryGirl.create(:cart, user: user)}
    let(:product){ FactoryGirl.create(:product)}

    it "should increment the count by 1 if product is added" do
      existingProductsInCart = cart.products.length
      cart.scan(product)
      expect(cart.products.length).to eq(existingProductsInCart + 1)
      expect(cart.products).to include(product)
    end
  end

end
