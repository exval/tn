require_relative 'carriage'
require_relative 'accessor'
require_relative 'validation'


class CargoCarriage < Carriage
  include Validation
  extend Accessors

  attr_accessor_with_history :occupied_volume, :volume

  validate :volume, :presence
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
end
