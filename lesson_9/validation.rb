module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send(:include, InstanceMethods)
  end

  module ClassMethods
    attr_accessor :validations

    def validate (name, type, params = nil)
      @validations ||= []
      @validations << {name: name, type: type, params: params}
    end
  end

  module InstanceMethods
    VAL_FORMAT = /^[a-zа-яё\d]{3}\-?[a-zа-яё\d]{2}$/i
    
    def validate?
      validate!
      true
    rescue StandardError
      false
    end

    protected
  
    def validate_presence(value, _)
      if value.nil? || value == ''
        raise 'Значение не может быть пустым.'
      end
    end
  
    def validate_format(value, format)
      raise 'Неверный формат' if value !~ format 
    end
  
    def validate_type(value, type)
      raise 'Неверный тип' unless value.is_a?(type)
    end
  
    def validate!
      self.class.validations.each do |validation|
        name = instance_variable_get("@#{validation[:name]}".to_sym)
        method_name = "validate_#{validation[:type]}".to_sym
        send(method_name, value, validation[:params])
      end    
    end
  end
end
  