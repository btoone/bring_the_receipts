require_relative './test_helper'

module ShoppingBasket
  class OrderTest < Minitest::Test
    def setup
      @items = [
        {quantity: 2, title: "book", price: 12.49, exempt: true},
        {quantity: 1, title: "music CD", price: 14.99, exempt: false},
        {quantity: 1, title: "chocolate bar", price: 0.85, exempt: true},
        {quantity: 1, title: "imported box of chocolates", price: 10.00, exempt: true, imported: true},
        {quantity: 1, title: "imported bottle of perfume", price: 47.50, exempt: false, imported: true},
      ]

      @order = Order.new(@items)
    end

    def test_returns_items
      assert_equal @order.items, @items
    end

    def test_calculates_subtotal
      regular_item = @items[1]
      assert_equal 16.49, @order.subtotal(regular_item)
    end

    def test_calculates_subtotal_on_exempt_items
      exempt_item = @items[0]
      assert_equal 24.98, @order.subtotal(exempt_item)
    end

    def test_calculates_subtotal_on_exempt_and_imported_items
      imported_item = @items[3]
      assert_equal 10.50, @order.subtotal(imported_item)
    end

    def test_calculates_subtotal_on_imported_items
      imported_item = @items[4]
      assert_equal 54.65, @order.subtotal(imported_item)
    end

    def test_adds_subtotal_to_item
      assert_includes @order.items[0].keys, :subtotal
    end
  end
end

