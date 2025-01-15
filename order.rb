module ShoppingBasket
  SALES_TAX_RATE = 0.10

  class Order
    attr_reader :items

    def initialize(items)
      @items = build_items(items)
    end

    def build_items(items)
      items.each do |item|
        item[:subtotal] = subtotal(item).round(2)
      end
    end

    def subtotal(item)
      tax = item[:price] * SALES_TAX_RATE
      subtotal = (item[:price] * item[:quantity])

      return subtotal.round(2) if item[:exempt]

      (subtotal + tax).round(2)
    end
  end
end

