require 'spec_helper'
require_relative '../support/shared/examples'

describe BatchFactory::Parser do
  context 'when parsing default worksheet' do
    let(:rows) { subject.call VALID_SPREADSHEET_XLS }
    it_behaves_like 'valid spreadsheet parser'
  end

  context 'when parsing second worksheet' do
    let(:rows) { subject.call(VALID_SPREADSHEET_XLS, sheet_number: 1) }
    it_behaves_like 'valid spreadsheet parser'
  end
end

