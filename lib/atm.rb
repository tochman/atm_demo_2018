class Atm 
    attr_accessor :funds

    def initialize
        @funds = 1000
    end 

    def withdraw(amount, account)
        if insufficient_funds_in_account?(amount, account)
            {status: false, message: 'not enough funds in account', date: Date.today}
        else
            perfom_transaction(amount, account)
        end
       
    end

    private

    def insufficient_funds_in_account?(amount, account) 
        amount > account.balance
    end 

    def perfom_transaction(amount, account)
        @funds -= amount
        account.balance -= amount 
        {status: true, message: 'success', date: Date.today, amount: amount}
    end 


end