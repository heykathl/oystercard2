class Oystercard 
  def initialize
    @balance = 0
    @in_journey = false
  end 

  attr_reader :balance, :in_journey
  LIMIT = 90
  FARE = 1

  def top_up(value)
    raise "Your balance is now £#{@balance}. Maximum limit of £90 reached" if limit_reached?
    @balance += value
  end

  def touch_in
    raise "Insufficient balance" if @balance < FARE
    @in_journey = true
  end

  def touch_out
    deduct(FARE)
    @in_journey = false
  end

  private

  def deduct(value)
    @balance -= value
  end

  def limit_reached?
    @balance >= LIMIT
  end 
end