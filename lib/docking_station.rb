require_relative 'bike.rb'

class DockingStation

attr_reader :bikes

DEFAULT_CAPACITY= 20

def initialize
  @bikes = []

end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

def dock(bike)
  fail 'Docking station full' if full?
  @bikes << bike
end

private

def empty?
  if @bikes == []
    true
  else
    false
  end
end

def full?
  if @bikes.count >= DEFAULT_CAPACITY
    true
  else
    false
  end
end

end
