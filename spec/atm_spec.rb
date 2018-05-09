require './lib/atm.rb'

describe Atm do 
    it 'holds 1000 on initialize' do 
        expect(subject.funds).to eq 1000 
    end

    it 'funds are reduced on withdraw' do 
        subject.withdraw(50)
        expect(subject.funds).to eq 950 
    end
end
