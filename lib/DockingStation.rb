require_relative 'bike'

class DockingStation
  attr_reader :bike
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @broken_bikes = []
  end

  def release_bike
    fail 'No bikes available.' if empty?
    @bikes.pop
  end

  def move_bikes
    @broken_bikes.pop(@broken_bikes.count)
  end

  def load_bikes_from(van)
    (van.move_bikes).each do |bike|
      @bikes << bike
    end
  end

  def dock(bike)
    fail 'Docking station full.' if full?
    if bike.broken? == true
      @broken_bikes << bike
    else
      @bikes << bike
    end
  end

  private

  attr_reader :bikes
  attr_reader :broken_bikes

  def full?
    (bikes.count + broken_bikes.count) >= capacity
  end

  def empty?
    bikes.empty?
  end
end
