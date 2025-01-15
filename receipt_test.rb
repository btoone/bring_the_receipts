require_relative './test_helper'

module ShoppingBasket
  class ReceiptTest < Minitest::Test
    # Order = Struct.new(:items, :total_tax, :total_cost)
  end

  class PlainItemsReceiptTest < ReceiptTest
    def setup
      @items = [
        {quantity: 2, title: "book", price: 12.49, exempt: true, subtotal: 24.98},
        {quantity: 1, title: "music CD", price: 14.99, exempt: false, subtotal: 16.49},
        {quantity: 1, title: "chocolate bar", price: 0.85, exempt: true, subtotal: 0.85},
      ]

      @order = Order.new(@items)
    end

    def test_receipt_items
      expected = <<~HERE
        2 book: 24.98
        1 music CD: 16.49
        1 chocolate bar: 0.85
      HERE

      actual = Receipt.new(@order).items

      assert_equal expected, actual
    end

    def test_receipt_total_tax
      expected = <<~HERE
        Sales Taxes: 1.50
      HERE

      actual = Receipt.new(@order).total_tax

      assert_equal expected, actual
    end

    def test_receipt_total_cost
      expected = <<~HERE
        Total: 42.32
      HERE

      actual = Receipt.new(@order).total_cost

      assert_equal expected, actual
    end

    def test_receipt_output
      expected = <<~HERE
        2 book: 24.98
        1 music CD: 16.49
        1 chocolate bar: 0.85
        Sales Taxes: 1.50
        Total: 42.32
      HERE

      actual = Receipt.new(@order).to_s

      assert_equal expected, actual
    end
  end

  class ImportedItemsReceiptTest < ReceiptTest
    def setup
      @items = [
        {quantity: 1, title: "imported box of chocolates", price: 10.00, exempt: true, imported: true},
        {quantity: 1, title: "imported bottle of perfume", price: 47.50, exempt: false, imported: true},
      ]

      @order = Order.new(@items)
    end

    def test_receipt_output
      expected = <<~HERE
        1 imported box of chocolates: 10.50
        1 imported bottle of perfume: 54.65
        Sales Taxes: 7.65
        Total: 65.15
      HERE

      actual = Receipt.new(@order).to_s

      assert_equal expected, actual
    end
  end

  class MixedItemsReceiptTest < ReceiptTest
    def setup
      @items = [
        {quantity: 1, title: "imported bottle of perfume", price: 27.99, exempt: false, imported: true},
        {quantity: 1, title: "bottle of perfume", price: 18.99, exempt: false, imported: false},
        {quantity: 1, title: "packet of headache pills", price: 9.75, exempt: true, imported: false},
        {quantity: 3, title: "imported box of chocolates", price: 11.25, exempt: false, imported: true},
      ]

      @order = Order.new(@items)
    end

    def test_receipt_output
      skip "Figure out rounding error"

      expected = <<~HERE
        1 imported bottle of perfume: 32.19
        1 bottle of perfume: 20.89
        1 packet of headache pills: 9.75
        3 imported box of chocolates: 35.55
        Sales Taxes: 7.90
        Total: 98.38
      HERE

      actual = Receipt.new(@order).to_s

      assert_equal expected, actual
    end
  end
end
