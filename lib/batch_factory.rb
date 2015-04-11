require 'batch_factory/worksheet'
require 'batch_factory/version'
require 'batch_factory/parser'

module BatchFactory
  def self.from_file(file, options = {})
    BatchFactory::Parser.call(file, options)
  end
end

