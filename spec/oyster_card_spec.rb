require 'oyster_card'

describe Oystercard do
  
  describe "balance" do
    it "respond to balance" do
      expect(subject).to respond_to(:balance)
    end 
    it 'should top up balance' do
      expect(subject).to respond_to(:top_up).with(1).argument
      expect{subject.top_up(5)}.to change {subject.balance}.by(5)
    end
    it "raises error if top up exceeds limit" do
      subject.top_up(90)
      expect{ subject.top_up(1) }.to raise_error "Your balance is now £90. Maximum limit of £90 reached" if subject.balance >= Oystercard::LIMIT
    end 
  end
end