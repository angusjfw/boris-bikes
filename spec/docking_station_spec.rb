require 'docking_station.rb'

describe DockingStation do
it "responds to release_bike" do
  expect(subject).to respond_to :release_bike
end
it "released bike is working" do
  bike = Bike.new
  subject.dock(bike)
  release_bike = subject.release_bike
  expect(release_bike).to be_working
end
it "can doc to station" do
  expect(subject).to respond_to(:dock).with(1).argument
end
it "responds to bike" do
  expect(subject).to respond_to :bikes
end


describe "#dock" do
  it "docks something" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

    it "raises an error when station is full" do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
      expect{subject.dock(Bike.new)}.to raise_error 'Docking station full'
    end


end

it "returns docked bikes" do
  bike = Bike.new
  subject.dock(bike)
  expect(subject.bikes).to eq [bike]
end
describe "#release_bike" do
  it 'releases a bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end
  it 'raises an error when there are no bikes available' do
    expect{subject.release_bike}.to raise_error 'No bikes available'
  end
end

end
