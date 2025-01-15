module ShoppingBasket
  SALES_TAX_RATE = 0.10

  class Receipt
    # attr_reader :order

    def initialize(order)
      @order = order
    end

    def to_s
      [items, total_tax, total_cost].join
    end

    def items
      @order.items.map do |item|
        "#{item[:quantity]} #{item[:title]}: #{'%.2f' % subtotal(item)}\n"
      end.join
    end

    def total_tax
      "Sales Taxes: #{'%.2f' % @order.total_tax}\n"
    end

    def total_cost
      "Total: #{'%.2f' % @order.total_cost}\n"
    end

    private

    def subtotal(item)
      tax = item[:price] * SALES_TAX_RATE
      subtotal = (item[:price] * item[:quantity]) 

      return subtotal if item[:exempt]
        
      subtotal + tax
    end
  end
end
