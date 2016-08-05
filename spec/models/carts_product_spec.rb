require 'rails_helper'

RSpec.describe CartsProduct, :type => :model do
  describe "validations" do
    it { should belong_to(:product) }
    it { should validate_numericality_of(:quantity) }
  end

  describe "with products in cart" do
  	let(:product) { Product.new }
	let(:cart) { Cart.new }

    pending "total product price should be Ouantity * Product Price" do
      expect(product.price).to eql(40)
    end
  end
end
