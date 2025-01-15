class Receipt
  # attr_reader :order

  def initialize(order)
    @order = order
  end

  def to_s
    items
  end

  def items
    @order.items.map do |item|
      "#{item[:quantity]} #{item[:title]}: #{item[:subtotal]}\n"
    end.join
  end

  def total_tax
    "Sales Taxes: #{'%.2f' % @order.total_tax}\n"
  end
end
