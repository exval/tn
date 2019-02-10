require_relative 'manufacturer'
class Carriage
  include Manufacture
  attr_reader :type
end
