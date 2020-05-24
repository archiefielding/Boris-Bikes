require_relative 'DockingStation'

class Van
  def initialize
    @bikes = []
  end

  def load_bikes_from(docking_station)
    @bikes = docking_station.move_broken_bikes
  end
end
