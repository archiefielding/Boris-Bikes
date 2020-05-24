require_relative 'bike'

class DockingStation
  attr_reader :bike
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'No bikes available.' if empty?
    fail 'No bikes available.' if working_bikes?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full.' if full?
    @bikes << bike
  end

  def bike_check
    @bikes.all? { |bike| bike.broken? }
  end

  private

  attr_reader :bikes

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

  def working_bikes?
    bike_check
  end
end
