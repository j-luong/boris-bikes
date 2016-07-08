class Bike

  def initialize
    @working = true
  end

  def working?
    @working
  end

  def reported_broken
    @working = false
  end
end
