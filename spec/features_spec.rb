require 'docking_station'
require 'bike'
require 'garage'

describe 'features' do

  describe 'collecting from stations' do

    it 'collecting bikes with van removes all broken bikes' do
      station = DockingStation.new
      2.times { station.dock(Bike.new) }
      2.times { station.dock(Bike.new.broken) }
      garage = Garage.new
      garage.collect(station)
      expect(station.bikes.length).to eq(2)
    end

  end

  describe 'dropping vans at stations' do

    it 'bikes are deposited to the station' do
      station = DockingStation.new
      2.times { station.dock(Bike.new) }
      2.times { station.dock(Bike.new.broken) }
      garage = Garage.new
      garage.collect(station)
      garage.deposit(station)
      expect(station.bikes.length).to eq(4)
    end

    it 'all deposited bikes are fixed' do
      station = DockingStation.new
      2.times { station.dock(Bike.new) }
      2.times { station.dock(Bike.new.broken) }
      garage = Garage.new
      garage.collect(station)
      garage.deposit(station)
      expect(station.bikes.all? {|bike|bike.working?}).to eq(true)
    end

  end

end
