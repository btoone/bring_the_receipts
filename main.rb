require_relative './receipt'
require_relative './order'

require 'csv'

# Order = Struct.new(:items, :total_tax, :total_cost)

# items = [
#   {quantity: 2, title: "book", price: 12.49, exempt: true},
#   {quantity: 1, title: "music CD", price: 14.99, exempt: false},
#   {quantity: 1, title: "chocolate bar", price: 0.85, exempt: true},
# ]

data = <<~HERE
  Quantity,Title,Price,Exempt
  2,book,12.49,true
  1,music CD,14.99,false
  1,chocolate bar,0.85,true
HERE

table = CSV.parse(data, headers: true, header_converters: :symbol)
items = table.map do |row|
  {
    title: row[:title],
    price: row[:price].to_f,
    quantity: row[:quantity].to_i,
    exempt: row[:exempt] == "true",
  }
end

order = ShoppingBasket::Order.new(items)

receipt = ShoppingBasket::Receipt.new(order)
puts receipt

puts "\n==============\n\n"

# items = [
#   {quantity: 1, title: "imported box of chocolates", price: 10.00, exempt: true, imported: true},
#   {quantity: 1, title: "imported bottle of perfume", price: 47.50, exempt: false, imported: true},
# ]

data = <<~HERE
  Quantity,Title,Price,Exempt,Imported
  1,imported box of chocolates,10.00,true,true
  1,imported bottle of perfume,47.50,false,true
HERE

table = CSV.parse(data, headers: true, header_converters: :symbol)
items = table.map do |row|
  {
    title: row[:title],
    price: row[:price].to_f,
    quantity: row[:quantity].to_i,
    exempt: row[:exempt] == "true",
    imported: row[:imported] == "true"
  }
end

order = ShoppingBasket::Order.new(items)

receipt = ShoppingBasket::Receipt.new(order)
puts receipt
