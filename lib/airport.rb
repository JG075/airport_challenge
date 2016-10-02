require_relative "plane"
require_relative "weather"

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :planes
  attr_reader :capacity

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise "Cannot land due to stormy weather" if stormy?
    raise "Cannot land plane as airport is full" if full?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    raise "Cannot takeoff due to stormy weather" if stormy?
    plane.take_off
    @planes.delete(plane)
  end

  private

  def stormy?
    @weather.stormy?
  end

  def full?
    planes.count >= @capacity
  end

end