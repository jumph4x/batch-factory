require 'rspec'
require 'rspec/its'

require 'batch_factory'

ASSETS_DIR = File.expand_path File.join(File.dirname(__FILE__), 'support', 'files')
VALID_SPREADSHEET_XLS = File.join(ASSETS_DIR, 'valid-spreadsheet.xls')
VALID_SPREADSHEET = File.join(ASSETS_DIR, 'valid-spreadsheet')

RSpec.configure do |config|
  config.mock_with :rspec
  config.order = 'random'
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.fail_fast = false
end

