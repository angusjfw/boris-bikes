require 'van'

describe Van do

  let(:station) { double :station}
  let(:garage) { double :garage }
  let(:working_bike) { double :working_bike }
  let(:broken_bike) { double :bike_bike }

  describe '#collect' do
    it 'responds to collect' do
      expect(subject).to respond_to(:collect).with(2).argument
    end
  
    it 'takes a broken bike from station when collecting' do
      allow(broken_bike).to receive(:working?) {false}
      allow(station).to receive(:bikes) {[broken_bike]}
      subject.collect(station, garage)
      expect(subject.bikes).to eq([broken_bike])
    end

    it 'does not take working bikes from station when collecting' do
    end

    it 'takes all the broken bikes when collecting' do
    end
  end
  
  describe '#deposit' do
    it 'responds to deposit' do
      expect(subject).to respond_to(:deposit).with(2).argument
    end  
  end

end
