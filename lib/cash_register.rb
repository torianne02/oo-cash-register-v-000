class CashRegister
  attr_accessor :total, :discount

  def initialize(discount = nil)
    @total = 0
    @discount = discount
  end

  def add_item(title, price, quantity = nil)
    if quantity == nil
      @total += price
    else
      item_total_price = price * quantity
      @total += item_total_price
    end
  end
end
