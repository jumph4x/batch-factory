require 'spec_helper'

describe BatchFactory do
  context 'given a valid spreadsheet file path' do
    it 'should open a file and return an array of hashes containing row data' do
      worksheet = BatchFactory.from_file VALID_SPREADSHEET_XLS

      expect(worksheet.size).to eq 1
      expect(worksheet[0][:age]).to eq 50
    end
  end
end

