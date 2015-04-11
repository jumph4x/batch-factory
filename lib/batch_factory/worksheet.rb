require 'roo'

module BatchFactory
  class Worksheet
    attr_reader :name, :number

    def initialize(file, options = {})
      number = options.delete(:sheet_number) || 0
      @spreadsheet = Roo::Spreadsheet.open(file, options)
      @name = @spreadsheet.sheets[number]
    end

    def respond_to_missing?(method, include_private)
      @spreadsheet.respond_to? method.to_sym
    end

    def method_missing(method, *args, &block)
      @spreadsheet.send(method, *(args + [@name]), &block)
    end
  end
end

