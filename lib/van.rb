class Van

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect station, garage
    @bikes += station.bikes.select { |bike| !(bike.working?) }
    #station.bikes.select! { |bike| (bike.working?) }
  end

  def deposit station, garage
  end

end
