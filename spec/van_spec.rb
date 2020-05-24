require 'Van'

describe Van do
  it 'loads broken bikes from a docking station' do
    docking_station = DockingStation.new
    broken_bike = Bike.new
    broken_bike.report_broken
    docking_station.dock(broken_bike)
    expect(subject.load_bikes_from(docking_station)).to eq [broken_bike]
  end

  it 'releases broken bikes' do
    bike = Bike.new
    bike.report_broken
    docking_station = DockingStation.new
    docking_station.dock(bike)
    subject.load_bikes_from(docking_station)
    expect(subject.move_bikes).to eq [bike]
  end
end
