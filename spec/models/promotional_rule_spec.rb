require 'rails_helper'

RSpec.describe PromotionalRule, :type => :model do
  describe "validations" do
    it { should belong_to(:product) }
    it { should validate_numericality_of(:discount_price) }
    #it { should validate_discount_percentage_cannot_be_greater_than_total_value }
  end
end
