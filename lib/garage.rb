class Garage

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect station
    @bikes += station.bikes.select { |bike| !(bike.working?) }
    station.bikes.select! { |bike| (bike.working?) }
  end

  def deposit station
    bikes.each do |bike|
      bike.fix!
      station.dock(bike)
    end
    @bikes = []
  end

end
