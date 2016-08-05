FactoryGirl.define do
  sequence :code do |n|
    "#{n}#{Time.now.to_i}"
  end
end

FactoryGirl.define do
  factory :product do
    code { generate(:code) }
    name FFaker::Product.product_name
    description FFaker::Product.product
    sequence(:price, 10)
  end

end
