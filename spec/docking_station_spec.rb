require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to(:get_bikes) }

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.get_bikes).to eq [bike]
  end

  describe '#release_bike' do
    it { is_expected.to respond_to(:release_bike) }

    it 'Releases a working bike' do
      bike = Bike.new
      subject.dock(bike)
      bike = subject.release_bike
      expect(bike).to be_working # same as expect(bike.check_working?).to eq true
    end

    it "will not release a broken bike" do
      bike = Bike.new
      subject.dock(bike)
      subject.report_broken
      expect{bike = subject.release_bike}.to raise_error("Error, no working bikes available.")
    end


    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when no bikes availabe' do
      expect{subject.release_bike}.to raise_error("Error, no bikes available.")
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'raises an error when capacity full' do
      subject.capacity.times { subject.dock(Bike.new) }
      expect {subject.dock(Bike.new)}.to raise_error("Error, docking station at full capacity.")
    end

    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end
  end

  describe '#capacity' do
    it 'Expects capacity to default to 20 if no arguments passsed' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'Expects capacity to equal value of argument passed' do
      stn_1 = DockingStation.new(100)
      expect(stn_1.capacity).to eq 100
    end
  end
end
