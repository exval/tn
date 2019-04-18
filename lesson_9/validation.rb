module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send(:include, InstanceMethods)
  end

  module ClassMethods
    attr_accessor :validations


    def validate?
      validate!
      true
    rescue StandardError
      false
    end
  
    def validate_presence
      
    end
  
    def validate_format
      
    end
  
    def validate_type
      
    end
    
    private
  
    def validate!
      
    end
  end
end
  