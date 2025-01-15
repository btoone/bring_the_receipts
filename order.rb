module ShoppingBasket
  class Order
    attr_reader :items

    def initialize(items)
      @items = build_items(items)
    end

    def build_items(items)
      items.each do |item|
        item[:subtotal] = 0.0
      end
    end
  end
end

