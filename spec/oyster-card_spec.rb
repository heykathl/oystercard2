require 'oyster-card'

describe Oystercard do
  
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}
  let(:journey) {double :journey}

  describe "balance" do
    it "respond to balance" do
      expect(subject).to respond_to(:balance)
    end 
  end

  describe "top_up" do
    it 'should top up balance' do
      expect(subject).to respond_to(:top_up).with(1).argument
      expect{subject.top_up(5)}.to change {subject.balance}.by(5)
    end
    it "raises error if top up exceeds limit" do
      subject.top_up(90)
      expect{ subject.top_up(1) }.to raise_error "Your balance is now £90. Maximum limit of £90 reached" 
    end 
  end

  describe "touch_out" do
    before do
      subject.top_up(20)
      subject.touch_in(entry_station)
    end

    it "deducts minimum fare when touched out" do
      expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by(-1)
    end

    it "deducts penalty fare journey is incomplete (no touch out)" do
      expect{ subject.touch_in(entry_station) }.to change{ subject.balance }.by(-6)
    end 

    it "deducts penalty fare when no touch in" do
      subject.touch_out(exit_station)
      expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by(-6)
    end
  end

  describe 'touch_in' do
    it "raises error if insufficient balance when touching in" do
      expect{ subject.touch_in(:entry_station) }.to raise_error "Insufficient balance" 
    end 

    it 'after touched in saves the entry station' do
      allow(Journey).to receive(:new).and_return(journey)
      subject.top_up(1)
      subject.touch_in(:entry_station)
      expect(subject.journey).to eq journey
    end
  end

  describe 'list of journeys' do
    it 'should have an empty list of journeys by default' do
      expect(subject.journey_list).to be_empty
    end
    
    it 'saves entry station to journey list' do
      allow(Journey).to receive(:new).and_return(journey)
      subject.top_up(1)
      subject.touch_in(:entry_station)
      expect(subject.journey_list).to include subject.journey
    end
  end

  it "deducts penalty fare when no touch in (first journey)" do
    expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by(-6)
  end
end