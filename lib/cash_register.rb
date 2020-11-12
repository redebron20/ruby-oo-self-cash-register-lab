require 'pry'
class CashRegister
    attr_accessor :discount, :total, :last_transaction, :quantity
    attr_reader :items
    attr_writer

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = []
    end

    def add_item(item, price, quantity = 1)
        
        self.total += (price * quantity)
        self.quantity = quantity
        last_transaction << price * quantity
        last_transaction << item
        while quantity > 0    
            items << item
            quantity -= 1
        end
    end
   
    def apply_discount
        if discount > 0
            self.total -= (total * (discount/100.0)).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end           
    end 

    def void_last_transaction
        #binding.pry
        
        self.total -= last_transaction[-2]
        quantity.times do 
            items.pop
            last_transaction.pop
        end
        
        

    end

    
end

  