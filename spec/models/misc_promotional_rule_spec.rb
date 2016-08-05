require 'rails_helper'

RSpec.describe MiscPromotionalRule, :type => :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_numericality_of(:discount_price) }
  end

end
