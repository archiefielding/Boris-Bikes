require_relative 'DockingStation'

class Van
  def initialize
    @bikes = []
  end

  def load_bikes_from(source)
    @bikes = source.move_bikes
  end

  def move_bikes
    @bikes.pop(@bikes.count)
  end
end
