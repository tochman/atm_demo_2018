class Atm 
    attr_accessor :funds

    def initialize
        @funds = 1000
    end 

    def withdraw(amount, pin_code, account)
        if insufficient_funds_in_account?(amount, account)
            {status: false, message: 'not enough funds in account', date: Date.today}
        elsif insufficient_funds_in_atm?(amount)
            {status: false, message: 'insufficient funds in ATM', date: Date.today}
        elsif wrong_pin?(pin_code, account)
            {status: false, message: 'wrong pin', date: Date.today}
        elsif card_expired?(account)
            {status: false, message: 'card expired', date: Date.today}
        else
            perfom_transaction(amount, account)
        end
       
    end

    private

    def insufficient_funds_in_account?(amount, account) 
        amount > account.balance
    end 

    def insufficient_funds_in_atm?(amount)
        amount > @funds
    end 

    def wrong_pin?(pin_code, account)
        pin_code != account.pin_code
    end 

    def card_expired?(account)
        Date.strptime(account.exp_date, '%m/%y') < Date.today
    end 

    def perfom_transaction(amount, account)
        @funds -= amount
        account.balance -= amount 
        {status: true, message: 'success', date: Date.today, amount: amount}
    end 


end