require 'docking_station'

describe DockingStation do

  describe '#class methods' do
    it { is_expected.to(respond_to(:get_bikes)) }
    it { is_expected.to(respond_to(:report_broken)) }
    it { is_expected.to(respond_to(:give_broken)) }
    it { is_expected.to(respond_to(:release_bike)) }
  end

  describe '#initialization' do
    subject { DockingStation.new } #similar to station = DockingStation.new
    let(:bike) { double(:bike) } #creates a new bike instance everytime bike is called in a new block
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do #described_class refers to the described_class in line 3
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error "Error, docking station at full capacity."
    end
  end

  describe '#release_bike' do
    let(:bike) { double(:bike) } #double is just a blank object used as a placeholder

    it 'Releases a working bike' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      bike = subject.release_bike
      expect(bike).to be_working # same as expect(bike.working?).to eq true
    end

    it "will not release a broken bike" do
      allow(bike).to receive(:working?).and_return(false) #bike is broken
      subject.dock(bike)
      expect{bike = subject.release_bike}.to raise_error("Error, no working bikes available.")
    end


    it 'releases a bike' do
      allow(bike).to receive(:working?).and_return(true) #bike is not broken
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when no bikes availabe' do
      expect{subject.release_bike}.to raise_error("Error, no bikes available.")
    end
  end

  describe '#dock' do
    let(:bike) { double(:bike)}
    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'raises an error when capacity full' do
      subject.capacity.times { subject.dock(bike) }
      expect {subject.dock(bike)}.to raise_error("Error, docking station at full capacity.")
    end

    it 'docks something' do
      bike = double(:bike) #can dock anything you want, so this is ok
      expect(subject.dock(bike)).to eq [bike]
    end
  end

  describe '#report_broken' do

  end

  describe '#get_bikes' do
    it 'returns docked bikes' do
      bike = double(:bike)
      subject.dock(bike)
      expect(subject.get_bikes).to eq [bike]
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

  describe '#broken_bikes' do
    it 'Returns a broken bike array' do
      expect(subject.give_broken).to eq []
    end
  end


end
