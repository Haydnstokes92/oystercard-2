require 'oystercard-2'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end
  
  describe '#top_up' do
    it 'increments the balance' do
      expect { subject.top_up(10) }.to change { subject.balance }.by (10)
    end
    it 'raises and error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::BALANCE_MAXED
      subject.top_up(maximum_balance)
      expect{ subject.top_up 1 }.to raise_error 'Balance exceeded'
    end
  end

  
end