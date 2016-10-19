require_relative 'bike'
require_relative 'van'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
      @bikes = []
      @broken_bikes = []
      @capacity = capacity
  end

  def release_bike
    raise "Error, no bikes available." if empty?
    raise "Error, no working bikes available." unless bikes.last.working?

    bikes.pop
  end

  def dock(bike)
    raise "Error, docking station at full capacity." if full?
    @bikes << bike
  end

  def report_broken
    @bikes[-1].reported_broken
  end

  def get_bikes
    @bikes
  end

  def give_broken
    @broken_bikes
  end

  private
  attr_reader :bikes

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end
end
