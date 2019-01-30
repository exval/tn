class Train
<<<<<<< HEAD
  attr_reader :number, :type 
  attr_accessor :current_station, :current_station_index, :route
=======
  attr_reader :number, :type, :route
  attr_accessor  :station_index
>>>>>>> fa02d8761f1bf3d99aec8248b46ee1d1f2fb700a
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
    return puts "One more carriage, now - #{@carriages}"
  end

  def unhook
    return puts "You are moving, stop and you can do this" unless moving
    @carriages -= 1
    return puts "One less carriages, now - #{@carriages}"
  end

  def moving
    @speed.zero?
  end

  def route_up(route)
<<<<<<< HEAD
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
=======
    @route = route
    @current_station = 0
    current_station.take_train(self)
  end

  def move_ahead
    if next_station 
      @route.stations.get_away(self)
      current_station.take_train(self)
      @station_index += 1
    end
  end

  def move_back
    if previous_station
      @route.stations[@station_index].get_away(self)
      current_station.take_train(self)
      @station_index -= 1
    end
  end

  def next_station
    @route.stations[@station_index + 1]
  end

  def previous_station
     @route.stations[@station_index - 1]
  end

  def current_station
    @route.stations[@station_index]
>>>>>>> fa02d8761f1bf3d99aec8248b46ee1d1f2fb700a
  end
end
