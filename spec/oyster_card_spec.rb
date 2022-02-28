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
  end
end