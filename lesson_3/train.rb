class Train
  attr_reader :number, :type, :route
  attr_accessor  :station_index
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
  end
end
