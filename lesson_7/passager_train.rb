class PassagerTrain < Train 
  attr_reader :type
  def initialize(number)
    super(number)
    @type = "Passager Train"
  end
end
