require 'spec_helper'

describe BatchFactory do
  context 'w/ class methods' do
    it 'should open a file and return a hashed workbook' do
      worksheet = BatchFactory.from_file VALID_SPREADSHEET
      puts worksheet.inspect
      worksheet.size.should == 1
      worksheet[0][:age].should == 50
    end
  end
end

