require 'oystercard-2'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq 0
  end
end