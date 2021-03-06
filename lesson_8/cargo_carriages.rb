require_relative 'carriage'

class CargoCarriage < Carriage
  attr_reader :volume
  attr_accessor :occupied_volume
  def initialize(volume)
    @type = 'Cargo'
    @volume = volume
    @occupied_volume = 0
    validate!
  end

  def occupied_vol(add_volume)
    if volume < occupied_volume
      raise "Ты не можешь больше добавить, максимальный объем #{volume}"
    end

    self.occupied_volume += add_volume
  end

  def free_volume
    @volume - @occupied_volume
  end

  private

  def validate!
    raise 'Это должно быть числом' unless volume.class == Integer
    raise 'Должно быть больше нуля' if volume < 0
  end
end
