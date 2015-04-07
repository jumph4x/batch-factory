require 'spec_helper'

describe BatchFactory::Parser do
  let(:parser){ BatchFactory::Parser.new }

  context 'w/ instance methods' do
    it 'should open and parse a valid file' do
      parser.open VALID_SPREADSHEET
      parser.worksheet.should_not be_nil
    end

    context 'when parsing default worksheet' do
      before do
        parser.open VALID_SPREADSHEET
        parser.parse!
      end

      it 'should parse column information' do
        parser.column_bounds.should == (0..5)
      end

      it 'should parse the heading keys' do
        parser.heading_keys.should == ['name', 'address', nil, 'country', 'bid', 'age']
      end

      it 'should parse the data rows' do
        parser.row_hashes[0]['age'].should == 50
        parser.row_hashes.size.should == 1
      end

      it 'should return a hashed worksheet' do
        worksheet = parser.hashed_worksheet
        worksheet.rows.should == parser.row_hashes
        worksheet.keys.should == parser.heading_keys
      end
    end

    context 'when parsing second worksheet' do
      before do
        parser.open VALID_SPREADSHEET, sheet_number: 1
        parser.parse!
      end

      it 'should parse column information' do
        parser.column_bounds.should == (2..7)
      end

      it 'should parse the heading keys' do
        parser.heading_keys.should == ['name', 'address', nil, 'country', 'bid', 'age']
      end

      it 'should parse the data rows' do
        parser.row_hashes[0]['age'].should == 50
        parser.row_hashes.size.should == 1
      end

      it 'should return a hashed worksheet' do
        worksheet = parser.hashed_worksheet
        worksheet.rows.should == parser.row_hashes
        worksheet.keys.should == parser.heading_keys
      end
    end
  end
end

