class DockingStation

attr_reader :bikes, :capacity

DEFAULT_CAPACITY= 20

def initialize(capacity=DEFAULT_CAPACITY)
  @bikes = []
  @capacity = capacity

end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'All bikes broken' if all_broken?
    bikes.sort!{|x,y| x.working?.to_s <=> y.working?.to_s}.pop
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

def all_broken?
  truth = bikes.map do |bike|
    bike.working?
  end
  !(truth.include?(true))
end

end
