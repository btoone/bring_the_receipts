require_relative './test_helper'

module ShoppingBasket
  class OrderTest < Minitest::Test
    def setup
      @items = [
        {quantity: 2, title: "book", price: 12.49, exempt: true},
        {quantity: 1, title: "music CD", price: 14.99, exempt: false},
        {quantity: 1, title: "chocolate bar", price: 0.85, exempt: true},
      ]

      @order = Order.new(@items)
    end

    def test_returns_items
      assert_equal @order.items, @items
    end
  end
end

