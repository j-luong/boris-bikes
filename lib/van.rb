class Van

  def initialize
    @bikes = []

  end

  def bikes
    @bikes
  end

  def get_broken(station)
    @bikes << station.release_bike
  end

end
