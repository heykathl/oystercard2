require 'station'

describe Station do
  let(:station) {Station.new("Bank", 1)}
  
  it "exposes station name" do
    expect(station.name).to eq("Bank")
  end

  it "exposes zone number" do
    expect(station.zone).to eq(1)
  end

end