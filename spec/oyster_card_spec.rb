require 'oyster_card'

describe Oystercard do
  
  describe "balance" do
    it "respond to balance" do
      expect(subject).to respond_to(:balance)
    end 
  end
end