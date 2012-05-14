require 'spreadsheet'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/hash/indifferent_access'

require 'batch_factory/version'
require 'batch_factory/parser'
require 'batch_factory/hashed_worksheet'

module BatchFactory
  class << self
    def from_file file_location
      parser = BatchFactory::Parser.new
      parser.open file_location
      parser.parse!
      
      parser.hashed_worksheet
    end
  end
end
