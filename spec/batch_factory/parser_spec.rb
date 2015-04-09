require 'spec_helper'

describe BatchFactory::Parser do
  let(:parser){ BatchFactory::Parser.new }

  context 'w/ instance methods' do
    it 'should open and parse a valid file' do
      parser.open VALID_SPREADSHEET
      expect(parser.worksheet).not_to be_nil
    end

    context 'when parsing default worksheet' do
      before do
        parser.open VALID_SPREADSHEET
        parser.parse!
      end

      it 'should parse column information' do
        expect(parser.column_bounds).to eq(0..5)
      end

      it 'should parse the heading keys' do
        expect(parser.heading_keys).to eq(['name', 'address', nil, 'country', 'bid', 'age'])
      end

      it 'should parse the data rows' do
        expect(parser.row_hashes[0]['age']).to eq 50
        expect(parser.row_hashes.size).to eq 1
      end

      it 'should return a hashed worksheet' do
        worksheet = parser.hashed_worksheet
        expect(worksheet.rows).to eq(parser.row_hashes)
        expect(worksheet.keys).to eq(parser.heading_keys)
      end
    end

    context 'when parsing second worksheet' do
      before do
        parser.open VALID_SPREADSHEET, sheet_number: 1
        parser.parse!
      end

      it 'should parse column information' do
        expect(parser.column_bounds).to eq(2..7)
      end

      it 'should parse the heading keys' do
        expect(parser.heading_keys).to eq(['name', 'address', nil, 'country', 'bid', 'age'])
      end

      it 'should parse the data rows' do
        expect(parser.row_hashes[0]['age']).to eq 50
        expect(parser.row_hashes.size).to eq 1
      end

      it 'should return a hashed worksheet' do
        worksheet = parser.hashed_worksheet
        expect(worksheet.rows).to eq(parser.row_hashes)
        expect(worksheet.keys).to eq(parser.heading_keys)
      end
    end
  end
end

