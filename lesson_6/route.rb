class Route
  attr_accessor :stations 
  def initialize(first, last)
    @first = first
    @last = last
    @stations = [first, last] << stations
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
    # raise "Начальная или конечная не является объектом класса." unless @stations.first.is_a?(Station) || @stations.last.is_a?(Station)
    # raise "Начальная и конечная станция одинаковые!" if @stations.first == @stations.last
    raise "Что-то пошло не так." if @stations.each {|station| return if station.is_a?(Station)}
    true  
  end
end
