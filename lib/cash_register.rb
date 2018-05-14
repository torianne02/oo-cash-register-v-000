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
    if @discount != nil
      @total = @total - ((@discount/100.0).to_i * @total)
      return "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    return @item_list
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end

end
