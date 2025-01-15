module ShoppingBasket
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
      "#{item[:quantity]} #{item[:title]}: #{'%.2f' % item[:subtotal]}\n"
    end.join
  end

  def total_tax
    "Sales Taxes: #{'%.2f' % @order.total_tax}\n"
  end

  def total_cost
    "Total: #{'%.2f' % @order.total_cost}\n"
  end
end
end
