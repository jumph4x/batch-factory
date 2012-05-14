module BatchFactory
  class HashedWorksheet
    attr_accessor :keys, :rows
    
    def initialize(keys, rows)
      @keys = keys
      @rows = rows
    end
    
    def method_missing(method, *args, &block)
      if (Enumerable.public_instance_methods + Array.public_instance_methods).include? method.to_sym
        @rows.send(method, *args, &block)
      else
        super
      end
    end
    
  end
end
