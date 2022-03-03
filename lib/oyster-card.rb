class Oystercard 
  def initialize
    @balance = 0
    @journey_list = []
    @journey = nil
  end 

  attr_reader :balance, :journey_list, :journey
  LIMIT = 90

  def top_up(value)
    raise "Your balance is now £#{@balance}. Maximum limit of £90 reached" if limit_reached?
    @balance += value
  end

  def touch_in(station)
    raise "Insufficient balance" if @balance < Journey::FARE 
    deduct(@journey.calculate_fare) if @journey != nil && @journey.in_journey?
    @journey = Journey.new(station)
    @journey_list << @journey
  end

  def touch_out(station)
    return deduct(Journey::PENALTY_FARE) if @journey == nil || !@journey.in_journey?
    @journey.exit(station)
    deduct(@journey.calculate_fare)
    # @journey_list << {:entry_station => @entry_station, :exit_station => @exit_station}
  end

  private

  def deduct(value)
    @balance -= value
  end

  def limit_reached?
    @balance >= LIMIT
  end 
end