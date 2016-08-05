require 'rails_helper'

RSpec.describe Product, type: :model do

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_uniqueness_of(:code) }
    it { should validate_numericality_of(:price) }
    it { should have_many(:carts_products) }
    #it { should have_many(:carts).through(:carts_products) }
    it { should have_many(:promotional_rules) }
  end


end
