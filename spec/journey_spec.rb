require "journey"

describe Journey do
  let(:station) {double :station}

  before do
    @journey = Journey.new(station)
  end

  it 'should be in journey when initialized' do
    expect(@journey).to be_in_journey
  end

  it 'should not be in journey when exiting station' do
    @journey.exit(station)
    expect(@journey).to_not be_in_journey
  end

  it 'saves exit station when exiting station' do
    @journey.exit(station)
    expect(@journey.exit_station).to eq station
  end

  it 'saves entry station when initialized' do
    expect(@journey.entry_station).to eq station
  end

  it "calculates minimum fare when journey is complete" do
    @journey.exit(station)
    expect(@journey.calculate_fare).to eq Journey::FARE
  end

  it "calculates penalty fare when journey is incomplete" do
    expect(@journey.calculate_fare).to eq Journey::PENALTY_FARE
  end
end