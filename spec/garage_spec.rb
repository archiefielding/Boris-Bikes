require 'Garage'

describe Garage do
  it 'loads broken bikes from a van' do
    bike = Bike.new
    bike.report_broken
    docking_station = DockingStation.new
    docking_station.dock(bike)
    van = Van.new
    van.load_bikes_from(docking_station)
    expect(subject.load_bikes_from(van)).to eq [bike]
  end


end
