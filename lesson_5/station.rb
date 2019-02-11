class Station
  @@all = {}
  def self.all_obj
     # ObjectSpace.each_object(Station).to_a
    @@all.each {|names| puts names}
  end
  
  attr_accessor :name, :trains
  def initialize(name)
    @name = name
    @trains = []
    @@all[name] = self 
  end

  def take_train (train)
    @trains << train   
  end
  
  def get_away(train)
    @trains.delete(train)
  end

  def type_of_train
    trains.select { |train| train.type == type }
  end
end
