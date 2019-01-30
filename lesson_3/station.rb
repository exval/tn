class Station
  attr_accessor :name, :trains
  def initialize(name)
    @name = name
    @trains = [] 
  end

  def take_train (train)
<<<<<<< HEAD:lesson_3/station.rb
    @trains << train   
=======
    @trains << train
>>>>>>> fa02d8761f1bf3d99aec8248b46ee1d1f2fb700a:lesson_3/station.rb
  end
  
  def get_away(train)
    @trains.delete(train)
  end

  def type_of_train
    trains.select { |train| train.type == type }
  end
end
