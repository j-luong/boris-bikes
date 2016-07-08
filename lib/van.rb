class Van

  def initialize
    @bikes = []

  end

  def bikes
    @bikes
  end

  def get_broken(station)
    @bikes << station.release_broken_bikes
  end

end
