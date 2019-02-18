class Route
  attr_accessor :stations 
  def initialize(first, last)
    @first = first
    @last = last
    @stations = [first, last] 
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

  def validate_route?
    validate_route!
    true
  rescue
    false    
  end

  private
  
  attr_reader :first, :last
  def validate_route!
    return if station?(first) && station?(last)
    raise "Начальная или конечная не является объектом класса."  
  end

  def station?(station)
    station.class == Station
  end
end
