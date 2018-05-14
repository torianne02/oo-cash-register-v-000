class CashRegister
  attr_accessor :total, :discount, :item_list

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @item_list = []
  end

  def add_item(title, price, quantity = nil)
    @item_list << title
    if quantity == nil
      @total += price
      @item_list << title
    else
      item_total_price = price * quantity
      @total += item_total_price
      @item_list << title.times(quantity)
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
    return @item_list
  end
end
