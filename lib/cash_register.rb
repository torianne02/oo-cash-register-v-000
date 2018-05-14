class CashRegister
  attr_accessor :total, :discount, :item_list, :last_transaction

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @item_list = []
  end

  def self.total
    @total
  end

  def add_item(title, price, quantity = nil)
    if quantity == nil
      @total += price
      @item_list << title
    else
      item_total_price = price * quantity
      @total += item_total_price
      quantity.times do @item_list << title
      end
    end
    @last_transaction = item_total_price
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

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end

end
