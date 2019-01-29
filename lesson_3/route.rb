class Route
  attr_accessor :stations 
  def initialize(first, last)
    @stations = [first, last] 
  end

  def add_intermediate(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    stations.delete(station)
  end

  def list_station
    stations.each { |stations| puts stations}
  end
end
