class Station
  attr_accessor :name, :trains

  def initialize(name)
    @name = name
    @trains = [] 
  end

  def take_train (train)
    @trains.push(train)   
  end
  
  def get_away(train)
    @trains.delete(train)
  end

  def type_of_train
    trains.select { |train| train.type == type }
  end
end
