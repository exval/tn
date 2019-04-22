require_relative 'instance_counter'
require_relative 'accessor'
require_relative 'validation'

class Station
  include InstanceCounter
  include Validation
  extend Accessors

  @@all = {}
  STATION_NAME = /[a-z]{3,}/i.freeze
  def self.all_obj
    # ObjectSpace.each_object(Station).to_a
    @@all.each { |names| puts names }
  end

  attr_accessor :name, :trains

  attr_accessor_with_history :name, :trains
  
  validate :name, :presence  
  validate :name, :format, STATION_NAME

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@all[name] = self
  end

  def take_train(train)
    @trains << train
  end

  def get_away(train)
    @trains.delete(train)
  end

  def type_of_train
    trains.select { |train| train.type == type }
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  def each_train
    trains.each_with_index do |train, index|
      index + 1
      yield train
    end
  end

  # def validate!
  #   raise 'Название должно содержать от 3-ёх букв ' if name !~ STATION_NAME

  #   true
  # end
end
