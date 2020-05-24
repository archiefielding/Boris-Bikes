require_relative 'Van'

class Garage
  def initialize
    @bikes = []
  end

  def load_bikes_from(van)
    @bikes = van.move_bikes
  end

  def fix_bikes
    @bikes.each do |bike|
      bike.fix
    end
  end

  def move_bikes
    @bikes.pop(@bikes.count)
  end
end
