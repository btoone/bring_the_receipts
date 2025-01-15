require_relative './receipt'
require_relative './order'

# Order = Struct.new(:items, :total_tax, :total_cost)

items = [
  {quantity: 2, title: "book", price: 12.49, exempt: true},
  {quantity: 1, title: "music CD", price: 14.99, exempt: false},
  {quantity: 1, title: "chocolate bar", price: 0.85, exempt: true},
]

order = ShoppingBasket::Order.new(items)

receipt = ShoppingBasket::Receipt.new(order)
puts receipt

puts "\n==============\n\n"

items = [
  {quantity: 1, title: "imported box of chocolates", price: 10.00, exempt: true, imported: true},
  {quantity: 1, title: "imported bottle of perfume", price: 47.50, exempt: false, imported: true},
]

order = ShoppingBasket::Order.new(items)

receipt = ShoppingBasket::Receipt.new(order)
puts receipt
