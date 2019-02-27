require_relative "train"
require_relative "cargo_train"
require_relative "passager_train"
require_relative "route"
require_relative "station"
require_relative "carriage"
require_relative "passager_carriages"
require_relative "cargo_carriages"

@all_stations = []
@all_trains = []
@route = nil


def main_menu
  loop do
  puts 'Выберите дейтсвие:'
  puts '1. Создать станцию'
  puts '2. Создать поезд'
  puts '3. Создать маршрут'
  puts '4. Добавить станцию к маршруту'
  puts '5. Убрать станцию из маршрута'
  puts '6. Назначить маршрут поезду'
  puts '7. Прицепить вагон к поезду'
    puts '8. Отцепить вагон от поезда'
    puts '9. Передвинуть поезд вперёд по маршруту'
    puts '10. Передвинуть поезд назад по маршруту'
    puts '11. Посмотреть список станций'
    puts '12. Посмотреть список поездов на станции'
    puts '13. Выход'
    choice = gets.to_i
    break if choice == 13
    what_do(choice)
  end
end

def what_do(choice)
  case choice
    when 1 then create_station
    when 2 then create_train
    when 3 then create_route
    when 4 then add_station_at_route
    when 5 then remove_station_from_route
    when 6 then assign_route_to_train
    when 7 then hook_to_train
    when 8 then unhook_from_train
    when 9 then go_ahead
    when 10 then go_back
    when 11 then choice_carriage
    # when 11 then list_station
    when 12 then list_trains_on_station
    when 13 then abort "Good luck, bye!"
    when 14 then list_carriage
    when 15 then take_seat
  end
end

def create_station  
  puts 'Введите название станции:'
  name_of_station = gets.chomp.to_s
  @all_stations << Station.new(name_of_station)
  puts "Создана новая станция - '#{name_of_station}'"
end

def create_train 
  puts "Введи его номер: "
  number = gets.chomp
  puts "Какой тип поезда? 1 - пассажирский , 2 - грузовой."
  type_of_train = gets.to_i
  if type_of_train == 1 
    @all_trains << PassagerTrain.new(number)
    puts "Создан пассжирский поезд с номером - #{number}"
  elsif type_of_train == 2
    @all_trains << CargoTrain.new(number)
    puts "Создан грузовой поезд с номером -  #{number}"
  else
    puts "Проверь, что ты вводишь корректно!"
    create_train
  end
end

def create_route
  return puts 'Маршрут уже существует' if @route
  return puts 'Должно быть создано не менее двух станций' unless @all_stations.length > 1
  list_station
  puts 'Выберите начальную станцию:'
  first_station = gets.to_i
  puts 'Выберите конечную станцию:'
  last_station = gets.to_i
  if first_station != last_station
    @route = Route.new(@all_stations[first_station - 1], @all_stations[last_station - 1])
  else
    create_route
  end
end

def add_station_at_route 
  list_station
  return no_route unless @route
  puts "Введи станцию, которую хочешь добавить:"
  station = @all_stations[choice_station - 1] 
  @route.add_intermediate(station)
end

def remove_station_from_route
  return 'Не может быть мешьне 2-ух станций' if @route.stations.size <= 2
  return no_route unless @route
  list_station
  puts 'Какую станцию ты желаешь удалить?'
  choice = gets.to_i
  station = @all_stations[choice - 1]
  @route.remove_station(station)
  puts "#{station.name} удалена\n"
end

def assign_route_to_train
  return no_route unless @route
  list_trains
  train = choice_train
  train.route_up(@route)
  puts "#{@route} for #{train.type} with #{train.number} "
end

def hook_to_train
  train = choice_train
  train.type == 'Passager Train' ? (puts 'Введи количество мест:') : (puts 'Введи объем:')
  number = gets.to_i
  carriage = train.type == 'Passager Train' ? PassagerCarriages.new(number) : CargoCarriages.new(number)
  train.hook(carriage)
end

def unhook_from_train
  train = choice_train
  train.unhook
end

def take_seat
  begin 
  carriage = choice_carriage
    if carriage.type == 'Passenger'
      carriage.take_seat
    else
      puts 'Введите объем:'
      volume = gets.to_i
      carriage.occupied_vol(volume)
    end
  rescue
  puts 'Не получилось.' 
  end
end

def go_ahead
  train = choice_train
  return no_route unless train.route
  train.move_ahead
end

def go_back
  train = choice_train
  return no_route unless train.route
  train.move_back
end

def list_trains
  @all_trains.each_with_index { |train, index| puts "#{index + 1}, поезд номер - #{train.number}"}
end

def list_station
  @all_stations.each_with_index { |station, index| puts "#{index + 1}, #{station.name}" }
end

def list_carriage
  @train = choice_train
  @train.each_carriage { |carriage| puts carriage }
end

def list_trains_on_station
  station = @all_stations[choice_station - 1]
  puts station.trains
end

def choice_train
  return no_train unless @all_trains.any?
  list_trains
  puts "Выбери поезд:"
  choice = gets.to_i
  choice <= @all_trains.size ? @all_trains[choice - 1] : choice_train
end

def choice_station
  list_station
  puts "Выбери станцию:"
  choice = gets.to_i
  choice <= @all_stations.size ? choice : choice_station
end

def choice_carriage
  list_carriage
  puts "Выбери вагон:"
  choice = gets.to_i
  choice <= @train.carriages.size ? @train.carriages[choice - 1] : choice_carriage

end

def no_route
  puts "Ещё нет ни одного маршрута"
end

def no_train
  puts 'Ни один поезд ещё не создан!'
end

main_menu
