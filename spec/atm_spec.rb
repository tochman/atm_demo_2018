require './lib/atm.rb'

describe Atm do 
    let(:account) {instance_double('Account')}
    before do 
        allow(account).to receive(:balance).and_return(100)
        allow(account).to receive(:balance=)
    end
    it 'holds 1000 on initialize' do 
        expect(subject.funds).to eq 1000 
    end

    it 'funds are reduced on withdraw' do 
        subject.withdraw(50, account)
        expect(subject.funds).to eq 950 
    end

    it 'allow withdraw if account has enough balance' do 
        expected_output = {status: true, message: 'success', date: Date.today, amount: 50}
        expect(subject.withdraw(50, account)).to eq expected_output
    end 

    it 'rejects withdraw if account do not have enough balance' do 
        allow(account).to receive(:balance).and_return(0) 
        #account.balance = 0 
        expected_output = {status: false, message: 'not enough funds in account', date: Date.today}
        expect(subject.withdraw(50, account)).to eq expected_output
    end 

    #{ status: true, message: 'success', date: '2016-01-30', amount: 35, bills: [20,10,5]}
    #{ status: false, message: '[reason for failure e. e. wrong pin]', date: '2016-01-30'}
end
