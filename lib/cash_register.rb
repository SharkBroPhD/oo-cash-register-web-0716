require 'pry'

class CashRegister
  attr_accessor :discount, :total

  def initialize (discount=0)
    @total=0
    @discount=discount
    @bag=[]
    @last_transaction=0
  end

  def discount
    @discount
  end

  def add_item(title, price, quantity=1)
    @total += price*quantity
    quantity.times do @bag<<title end
    @last_transaction=price*quantity
  end

  def items
    @bag
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
    @total*=(1-(@discount*0.01))
    "After the discount, the total comes to $#{@total.round}."
    end
  end

  def void_last_transaction
    @total-=@last_transaction
    @last_transaction=0
  end
end
