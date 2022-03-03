class Journey
  FARE = 1
  PENALTY_FARE = 6

  attr_reader :exit_station, :entry_station

  def initialize(station)
    @entry_station = station
    @exit_station = nil
  end 

  def in_journey?
    @exit_station == nil
  end

  def exit(station)
    @exit_station = station
  end

  def calculate_fare
    in_journey? ? PENALTY_FARE : FARE
  end
end