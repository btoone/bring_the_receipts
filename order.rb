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
        item[:subtotal] = subtotal(item).round(2)
      end
    end

    def subtotal(item)
      subtotal = (item[:price] * item[:quantity])

      # sales_tax = item[:price] * SALES_TAX_RATE
      sales_tax = round_up_to_nearest_0_05(item[:price] * SALES_TAX_RATE)
      subtotal += sales_tax unless item[:exempt]

      # import_duty = item[:price] * IMPORT_DUTY_RATE
      import_duty = round_up_to_nearest_0_05(item[:price] * IMPORT_DUTY_RATE)
      subtotal += import_duty if item[:imported]

      subtotal.round(2)
    end

    def round_up_to_nearest_0_05(tax_amount)
      (tax_amount * 20).ceil / 20.0
    end
  end
end

