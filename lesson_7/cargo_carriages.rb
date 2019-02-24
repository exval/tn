require_relative "carriage"

class CargoCarriages < Carriage 
  attr_reader :volume
  attr_accessor :occupied_volume
  def initialize(volume)
    @type = 'Cargo Train'
    @volume = volume
    @occupied_volume = 0
    validate!
  end

  def occupied_vol(add_volume)
    raise "Ты не можешь больше добавить, максимальный объем #{volume}" if volume < occupied_volume
    self.occupied_volume += add_volume
  end

  def free_volume
    @volume - @occupied_volume 
  end

  private

  def validate!
    raise "Это должно быть числом" unless self.volume.class == Fixnum
    raise "Должно быть больше нуля" if self.volume < 0
  end
end
