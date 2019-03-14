require_relative 'carriage'

class PassagerCarriage < Carriage
  attr_reader :all_seats, :taken_seat

  def initialize(all_seats)
    @type = 'Passenger'
    @all_seats = all_seats
    @taken_seat = 0
    validate!
  end

  def take_seat
    raise "Максимум мест #{@all_seats}" if all_seats == taken_seat

    @taken_seat += 1
  end

  def free_seats
    all_seats - taken_seat
  end

  private

  def validate!
    raise 'Это должно быть числом' unless @all_seats.class == Integer
    raise 'И положительным' unless @all_seats > 0
  end
end
