require 'spec_helper'

describe BatchFactory do
  context 'w/ class methods' do
    it 'should open a file and return a hashed workbook' do
      worksheet = BatchFactory.from_file VALID_SPREADSHEET
      expect(worksheet.size).to eq 1
      expect(worksheet[0][:age]).to eq 50
    end
  end
end

