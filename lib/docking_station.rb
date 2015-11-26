require_relative 'bike.rb'

class DockingStation

attr_reader :bikes, :capacity

DEFAULT_CAPACITY= 20

def initialize(capacity=DEFAULT_CAPACITY)
  @bikes = []
  @capacity = capacity

end

  def release_bike
    fail 'No bikes available' if empty?
    bikes.pop
  end

def dock(bike)
  fail 'Docking station full' if full?
  bikes << bike
end

private

def empty?
  bikes.empty?
end

def full?
  bikes.count >= capacity
end

end
