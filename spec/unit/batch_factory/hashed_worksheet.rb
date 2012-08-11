require 'spec_helper'

describe BatchFactory::HashedWorksheet do
  
  context 'w/ instance methods' do
    let(:worksheet) do
      parser = BatchFactory::Parser.new
      parser.open VALID_SPREADSHEET
      parser.parse!
      parser.hashed_worksheet
    end
    
    it 'should return an array of heading keys' do
      worksheet.keys[0].should == 'name'
    end
    
    it 'should return an array of data hashes' do
      worksheet.rows[0][:age].should == 50
    end
    
    it 'should iterate over the rows' do
      worksheet.size.should == 1
      worksheet.each_with_index do |hash, index|
        hash.should == worksheet.rows[index]
      end
    end
  end
  
end
