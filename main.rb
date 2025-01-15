require_relative './receipt'

Order = Struct.new(:items, :total_tax, :total_cost)

items = [
  {quantity: 2, title: "book", price: 12.49},
  {quantity: 1, title: "music CD", price: 14.99},
  {quantity: 1, title: "chocolate bar", price: 0.85},
]

order = Order.new(items, 1.50, 42.32)

receipt = ShoppingBasket::Receipt.new(order)
puts receipt
