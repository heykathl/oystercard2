class Oystercard 
  def initialize
    @balance = 0
  end 

  attr_reader :balance
  LIMIT = 90

  def top_up(value)
    raise "Your balance is now £#{@balance}. Maximum limit of £90 reached" if limit_reached?
    @balance += value
  end

  private
  def limit_reached?
    @balance >= LIMIT
  end 
end