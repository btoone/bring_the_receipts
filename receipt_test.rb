require_relative './test_helper'

module ShoppingBasket
  class ReceiptTest < Minitest::Test
    Order = Struct.new(:items, :total_tax, :total_cost)

    def setup
      @items = [
        {quantity: 2, title: "book", price: 12.49, exempt: true, subtotal: 24.98},
        {quantity: 1, title: "music CD", price: 14.99, exempt: false, subtotal: 16.49},
        {quantity: 1, title: "chocolate bar", price: 0.85, exempt: true, subtotal: 0.85},
      ]
      @order = Order.new(@items, 1.50, 42.32)
    end
  end

  class PlainItemsReceiptTest < ReceiptTest
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
    def test_foo
      assert_equal 1,1
    end
  end
end
