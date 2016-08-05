require 'rails_helper'

RSpec.describe CartsProduct, :type => :model do
  describe "validations" do
    it { should belong_to(:product) }
    it { should belong_to(:cart) }
  end
end
