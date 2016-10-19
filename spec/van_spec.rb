require 'van'

describe Van do

it { is_expected.to respond_to(:get_broken).with(1).argument }
it { is_expected.to respond_to(:bikes) }

  describe '#initialize' do
    it 'starts empty' do
      subject = Van.new
      expect(subject.bikes).to eq []
    end
  end

  describe '#gets_broken' do
  let(:station) { double(:station) }
  let(:bike) { double(:bike) }
    it 'gets bikes' do
      allow(station).to receive(:release_bike).and_return(bike)
      expect(subject.get_broken(station)).to eq [bike]
    end
  it 'stores bikes in an array' do
    allow(station).to receive(:release_bike).and_return(bike)
    subject.get_broken(station)
    expect(subject.bikes).to eq [bike]
  end
  it 'stores multiple bikes' do
    allow(station).to receive(:release_bike).and_return(bike)
    2.times {subject.get_broken(station)}
    expect(subject.bikes).to eq [bike, bike]
  end

end


end
