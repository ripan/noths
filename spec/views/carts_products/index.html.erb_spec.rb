require 'rails_helper'

RSpec.describe "carts_products/index", :type => :view do
  before(:each) do
    assign(:carts_products, [
      CartsProduct.create!(
        :cart_id => 1,
        :product_id => 2,
        :quantity => 3
      ),
      CartsProduct.create!(
        :cart_id => 1,
        :product_id => 2,
        :quantity => 3
      )
    ])
  end

  it "renders a list of carts_products" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
