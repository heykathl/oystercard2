require 'oyster_card'

describe Oystercard do
  
  let(:entry_station) {double :entry_station}

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
    # it 'should reduce balance by an amount' do
    #   expect(subject).to respond_to(:deduct).with(1).argument
    #   subject.top_up(5)
    #   expect{subject.deduct(5)}.to change {subject.balance}.by(-5)
    # end

    it "deducts fare when touched out" do
      subject.top_up(1)
      subject.touch_in(:entry_station)
      expect{ subject.touch_out }.to change{ subject.balance }.by(-1)
    end 

    it 'forgets entry station when touched out' do
      subject.top_up(1)
      subject.touch_in(:entry_station)
      subject.touch_out
      expect(subject.entry_station).to eq nil
    end
  end

  describe "in_journey" do
    it 'should return true if touched in' do
      subject.top_up(1)
      subject.touch_in(:entry_station)
      expect(subject.in_journey).to eq true
    end
    it 'should return false if touched out' do
      subject.top_up(1)
      subject.touch_in(:entry_station)
      subject.touch_out
      expect(subject.in_journey).to eq false
    end
  end

  describe 'touch_in' do
    it "raises error if insufficient balance when touching in" do
      expect{ subject.touch_in(:entry_station) }.to raise_error "Insufficient balance" 
    end 

    it 'after touched in saves the entry station' do
      subject.top_up(1)
      subject.touch_in(:entry_station)
      expect(subject.entry_station).to eq :entry_station
    end
  end
end