require 'DockingStation'

describe DockingStation do

  let(:bike) { double :bike }

  it { is_expected.to respond_to :release_bike }

  it { is_expected.to respond_to :bike }

describe 'dock' do
  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'docks something' do
    bike = double(:bike, broken?: false)
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'raises an error when full' do
    subject.capacity.times { subject.dock double(:bike, broken?: false) }
    expect { subject.dock(double(:bike, broken?: false)) }.to raise_error 'Docking station full.'
  end
end

  describe 'release_bike' do
    it 'releases a bike' do
      bike = double(:bike, broken?: false)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available.'
    end

    it 'will not release broken bikes' do
      bike = double(:bike, broken?: true)
      subject.dock(bike)
      expect{ subject.release_bike }.to raise_error 'No bikes available.'
    end

    it 'releases broken bikes' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect(subject.move_bikes).to eq [bike]
    end
  end

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { double(:bike, broken?: false) }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full.'
    end

    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock double(:bike, broken?: false) }
      expect{ docking_station.dock double(:bike, broken?: false) }.to raise_error 'Docking station full.'
    end
  end

end
