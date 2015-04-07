require 'spec_helper'

describe SpreadsheetDocument do
  context 'w/ filetype option' do
    subject { described_class.new(VALID_SPREADSHEET) }

    its(:filetype) { should eq('xls') }
  end

  context 'with filetype option' do
    subject { described_class.new(VALID_SPREADSHEET, filetype: 'xls') }

    its(:filetype) { should eq('xls') }
  end
end

