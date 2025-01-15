module ShoppingBasket
  SALES_TAX_RATE = 0.10
  IMPORT_DUTY_RATE = 0.05

  class Order
    attr_reader :items

    def initialize(items)
      @items = build_items(items)
    end

    def build_items(items)
      items.each do |item|
        item[:subtotal] = 0.0
        item[:tax] = 0.0

        item[:subtotal] = subtotal(item).round(2)
      end
    end

    def subtotal(item)
      subtotal = (item[:price] * item[:quantity])

      sales_tax = round_up_to_nearest_0_05(item[:price] * SALES_TAX_RATE)

      unless item[:exempt]
        subtotal += sales_tax
        item[:tax] += sales_tax
      end

      import_duty = round_up_to_nearest_0_05(item[:price] * IMPORT_DUTY_RATE)

      if item[:imported]
        subtotal += import_duty
        item[:tax] += import_duty
      end

      subtotal.round(2)
    end

    def total_tax
      @items.reduce(0) do |sum, item|
        sum + item[:tax]
      end
    end

    def total_cost
      @items.reduce(0) do |sum, item|
        sum + item[:subtotal]
      end
    end

    private

    def round_up_to_nearest_0_05(tax_amount)
      (tax_amount * 20).ceil / 20.0
    end
  end
end

