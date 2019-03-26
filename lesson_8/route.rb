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
    stations.each { |station| puts station.name }
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  protected

  attr_reader :first, :last

  def validate!
    stations.each do |station|
      unless station.is_a?(Station)
        raise 'Начальная или конечная не является объектом класса.'
      end
    end
    true
  end
end
