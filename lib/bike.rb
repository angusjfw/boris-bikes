
class Bike

  def initialize
    @working = true
  end

  def working?
    @working
  end

  def broken
    @working = false
    self
  end

  def fix!
    @working = true
    self
  end

end
