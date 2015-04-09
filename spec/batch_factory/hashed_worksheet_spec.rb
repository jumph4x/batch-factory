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
      expect(worksheet.keys[0]).to eq 'name'
    end

    it 'should return an array of data hashes' do
      expect(worksheet.rows[0][:age]).to eq 50
    end

    it 'should iterate over the rows' do
      expect(worksheet.size).to eq 1
      worksheet.each_with_index do |hash, index|
        expect(hash).to eq(worksheet.rows[index])
      end
    end
  end
end

