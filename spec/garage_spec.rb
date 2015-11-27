require 'garage'

describe Garage do

  let(:station) { double :station, dock: "cheers"}
  let(:working_bike) { double :working_bike, working?: true }
  let(:broken_bike) { double :broken_bike, working?: false, fix!: working_bike }

  describe '#collect' do
    it 'responds to collect' do
      expect(subject).to respond_to(:collect).with(1).argument
    end
  
    it 'takes a broken bike from station when collecting' do
      allow(station).to receive(:bikes) {[broken_bike]}
      subject.collect(station)
      expect(subject.bikes).to eq([broken_bike])
    end

    it 'does not take working bikes from station when collecting' do
      allow(station).to receive(:bikes) {[working_bike]}
      subject.collect(station)
      expect(subject.bikes).to be_empty
    end

    it 'takes all the broken bikes when collecting' do
      allow(station).to receive(:bikes) {[working_bike, broken_bike, broken_bike]}
      subject.collect(station)
      expect(subject.bikes).to eq([broken_bike, broken_bike])
    end
  end
  
  describe '#deposit' do
    it 'responds to deposit' do
      expect(subject).to respond_to(:deposit).with(1).argument
    end

    it 'deposits all bikes in van' do
      allow(station).to receive(:bikes) {[working_bike, broken_bike, broken_bike]}
      subject.collect(station)
      subject.deposit(station)
      expect(subject.bikes).to be_empty
    end

  end

end
