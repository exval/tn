module Accessors
  def attr_accessor_with_history(*names)
  names.each do |name|
    var_name =  "@#{name}".to_sym
    attr_history_name = "@#{name}_history".to_sym

      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=") do |v|
        instance_variable_set(var_name, v)
        attr_history = instance_variable_get(attr_history_name)
        attr_history ||= []
        attr_history << "#{name}_history: #{v}"
        instance_variable_set(attr_history_name, attr_history)
      end
      
      define_method("#{name}_history") { instance_variable_get(attr_history_name) }
    end
  end

  def strong_attr_accessor(name, type)
    attr_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(attr_name) }
    define_method("#{name}=") do |value|
      raise TypeError.new("Не совпадает тип") unless value.is_a?(type)
      instance_variable_set(attr_name, value)
    end
  end
end


class Test
  extend Accessors
  attr_accessor_with_history :a, :b, :k
  strong_attr_accessor :v, Fixnum
end
