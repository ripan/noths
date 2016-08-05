# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "** Creating products **"
products = [
  {
    code: "001",
    name: "Travel Card Holder",
    description: "Travel Card Holder",
    price: "9.25",

  },
  {
    code: "002",
    name: "Personalised cufflinks",
    description: "Personalised cufflinks",
    price: "45.00",

  },
  {
    code: "003",
    name: "Kids T-shirt",
    description: "Kids T-shirt",
    price: "19.95",

  },
]


products.each do |product|

  Product.create(
    code: product[:code],
    name:  product[:name],
    description:  product[:description],
    price:  product[:price],
  )

end

puts "** Creating user **"
user = User.create(email: "guest@abc.com", password: 'Password1')

puts "** Creating Misc Promotional rules. Applies to cart or user **"
MiscPromotionalRule.create(name: "Cart", discount_percentage: 10, discount_price: 60)

puts "** Creating promotional rules. Aplied to products **"
PromotionalRule.create(product: Product.find_by_name('Travel Card Holder'), quantity: 2, discount_percentage: 0, discount_price: 8.50)

