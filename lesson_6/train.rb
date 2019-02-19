require_relative 'manufacturer'
require_relative 'instance_counter'

class Train
  include Manufacture
  include InstanceCounter
  NUMBER = /^\d{3}[a-z]{2}$/i

  @@all_trains = {}
  
  def self.find(number)
    @@all_trains[number]
  end

  attr_reader :number, :type, :carriages, :speed
  attr_accessor :current_station, :current_station_index, :route
  def initialize(number)
    @number = number
    valid!
    @carriages = []
    @speed = 0
    @@all_trains[@number] = self
    register_instance
    puts "Создан поезд - ' #{number}'"
  end
  

  def acceleration
    @speed += 20
  end

  def stop
    @speed = 0 
  end

  def hook (carriage)
    return puts "You are moving, stop and you can do this" unless not_moving?
    carriages << carriage
  end

  def unhook
    return puts "You are moving, stop and you can do this" unless not_moving?
    return "Can't be minus" unless @carriages.any?
    carriages.pop
    return "One less carriages, now - #{carriages}"
  end

  def not_moving?
    @speed.zero?
  end

  def route_up(route)
    self.route = route
    @current_station_index = 0
    @current_station = self.route.stations.first
    @current_station.take_train(self)
  end

  def move_ahead
    return if current_station_index == route.stations.size - 1
    @current_station = next_station
    @current_station_index = next_index
    puts @current_station.name
  end

  def move_back
    return if current_station_index.zero?
    @current_station = previous_station
    @current_station_index = previos_index
    @current_station.name
  end

  def valid?
    validate!
  rescue
    false
  end

  protected
#методы move_ahead и move_back - это интерфесы, через них и идёт 
#управление поездом, не нужно давать 
#пользовтелю использовать использовать методы ниже. 

  def validate!
    raise "Некорректный номер (проверь шаблон)!" if number !~ NUMBER 
    true
  end
  
  def next_station
    return unless route
    self.route.stations[next_index]
  end

  def previous_station
    return unless route
    self.route.stations[previos_index]
  end

  def next_index
    current_station_index + 1
  end

  def previos_index
    current_station_index - 1
  end
end
