require 'rails_helper'

RSpec.describe "misc_promotional_rules/new", :type => :view do
  before(:each) do
    assign(:misc_promotional_rule, MiscPromotionalRule.new(
      :name => "MyString",
      :discount_percentage => "MyString",
      :discount_price => "MyString"
    ))
  end

  it "renders new misc_promotional_rule form" do
    render

    assert_select "form[action=?][method=?]", misc_promotional_rules_path, "post" do

      assert_select "input#misc_promotional_rule_name[name=?]", "misc_promotional_rule[name]"

      assert_select "input#misc_promotional_rule_discount_percentage[name=?]", "misc_promotional_rule[discount_percentage]"

      assert_select "input#misc_promotional_rule_discount_price[name=?]", "misc_promotional_rule[discount_price]"
    end
  end
end
