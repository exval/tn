class Train
  attr_reader :number, :type 
  attr_accessor :current_station, :current_station_index, :route
  def initialize(number, type, carriages)
    @number = number
    @type = type
    @carriages = carriages
    @speed = 0
  end

  def acceleration
    puts "Gaining speed"
    @speed += 20
  end

  def stop
    @speed = 0 
  end

  def hook
    return puts "You are moving, stop and you can do this" unless moving
    @carriages += 1
    puts "One more carriage, now - #{@carriages}"
  end

  def unhook
    return puts "You are moving, stop and you can do this" unless moving
    @carriages -= 1
    puts "One less carriages, now - #{@carriages}"
  end

  def moving
    @speed.zero?
  end

  def route_up(route)
    self.route = route
    self.current_station_index = 0
    self.current_station = route.stations.first
    self.current_station.take_train(self)
  end

  def move_ahead
    return if current_station_index == route.stations.size - 1
    self.current_station = next_station
    self.current_station_index = next_index
  end

  def move_back
    return if current_station_index.zero?
    self.current_station = previous_station
    self.current_station_index = previos_index
  end

  def next_station
    return unless route
    route.stations[next_index]
  end

  def previous_station
    return unless route
    route.stations[previos_index]
  end

  def next_index
    current_station_index + 1
  end

  def previos_index
    current_station_index - 1
  end
end
