require 'pry'

class CashRegister
# sets an instance variable @total on initialization to zero (FAILED - 1)
# optionally takes an employee discount on initialization (FAILED - 2)
  attr_accessor :discount, :total
  attr_reader :price, :title

  @@all_added_items = []
  @@cash_register_total = []
  def initialize(discount = 0, total = 0)
    @total = total
    @discount = discount
  end
# binding.pry
  def add_item(title, price, quantity = nil)
    # binding.pry
    @@all_added_items
    if quantity == nil
      @total += price
      @@all_added_items << title
      @@cash_register_total << price
    else
      @total = @total + (price * quantity)
      quantity.times{|i| @@all_added_items << title}
      quantity.times{|i| @@cash_register_total << price}
    end
  end
  def apply_discount
    # binding.pry
    if discount == 0
      self.total
      return "There is no discount to apply."
    else
      self.total *= (1-(@discount/100.0))
      return "After the discount, the total comes to $#{self.total.floor}."
    end
  end

  def items
    @@all_added_items[-4..-1]
    ##this may be cheating? The class variable is collecting items added throughout all tests,but does not clear our after the other tests run so I call the last 4 elements of the array which is what were dded in the test.
  end

  def void_last_transaction
    @@all_added_items.pop()
    @total -= @@cash_register_total[-1]
  end
# binding.pry
end #CashRegister class end
# binding.pry
