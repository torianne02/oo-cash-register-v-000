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

  def apply_discount
    if @discount == nil
      "There is no discount to apply."
    else
      money_saved = @discount * @total
      discounted_price = @total - money_saved
      return "After the discount, the total comes to $#{discounted_price}."
    end
  end

  def items
    item_list = []
    self.add_item.each do |title, price, quantity|
      item_list << title
    end
    return item_list
  end
end
