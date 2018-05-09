class Atm 
    attr_accessor :funds

    def initialize
        @funds = 1000
    end 

    def withdraw(amount, account)
        @funds -= amount
        account.balance -= amount
        return {status: true, message: 'success', date: Date.today, amount: amount}
    end

end