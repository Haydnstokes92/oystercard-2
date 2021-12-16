require 'station'

describe Station do
  subject {described_class.new("Liverpool Street", 1)}

  it 'name of station' do
    expect(subject.name).to eq("Liverpool Street")
  end

  it 'zone number' do
    expect(subject.zone).to eq(1)
  end
end