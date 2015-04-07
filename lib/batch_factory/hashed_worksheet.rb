module BatchFactory
  class HashedWorksheet
    attr_accessor :keys, :rows

    @@proxy_methods = Enumerable.public_instance_methods + Array.public_instance_methods

    def initialize(keys, rows)
      @keys = keys
      @rows = rows
    end

    def method_missing(method, *args, &block)
      if should_proxy_method?(method.to_sym)
        @rows.send(method, *args, &block)
      else
        super
      end
    end

    private

    def should_proxy_method?(method)
      @@proxy_methods.include? method
    end
  end
end
