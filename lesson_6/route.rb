class Route
  attr_accessor :stations 
  def initialize(first, last)
    @first = first
    @last = last
    @stations = [first, last]
    validate_route! 
  end

  def add_intermediate(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    stations.delete(station)
  end

  def list_station
    stations.each { |station| puts station.name}
  end

  def valid_route?
    valid_route!
  rescue
    false    
  end

  private

  def validate_route!
    raise "Начальная или конечная не является объектом класса." unless stations.first.is_a?(Station) || stations.last.is_a?(Station)
    true
  end

  def station?(station)
    station.class == Station
  end
end
