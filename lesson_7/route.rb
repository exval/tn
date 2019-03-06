class Route
  attr_accessor :stations 
  def initialize(first, last)
    @first = first
    @last = last
    @stations = [first, last]
    validate! 
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

  def valid?
    validate!
  rescue
    false    
  end

  private
  
  attr_reader :first, :last, :stations
  
  def validate! 
    stations.each {|station| raise "Начальная или конечная не является объектом класса." unless station.is_a?(Station)}
    true  
  end
end
