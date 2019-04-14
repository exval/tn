module Accessors
  def attr_accessor_with_history(*names)
  names.each do |name|
    var_name =  "@#{name}".to_sym
    attr_history_name = "@#{name}_history".to_sym

      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}_history") { instance_variable_get(attr_history_name) }

      define_method("#{name}=") do |v|
        hist_val = instance_variable_get(var_name)
        instance_variable_set(var_name, v)
        attr_history = instance_variable_get(:@attr_history_name)
        attr_history ||= []
        attr_history << hist_val
      end

      
    end
  end

  def strong_attr_accessor
    
  end
end


class Test
  extend Accessors
  attr_accessor_with_history :a, :b, :k
end
