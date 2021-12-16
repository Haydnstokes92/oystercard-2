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
    it 'deducts fare from balance' do
      subject.top_up(30)
      expect{ subject.deduct 5}.to change{ subject.balance }.by -5
    end
    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end
    it "can touch in" do
      subject.top_up(10)
      subject.touch_in
      expect(subject).to be_in_journey
    end
    it "can touch out" do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it "raises an error when touch_in is called and there is below minimum balance" do
      expect { subject.touch_in }.to raise_error "the balance is too low"
    end
  end
end