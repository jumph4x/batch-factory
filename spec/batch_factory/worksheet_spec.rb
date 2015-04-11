require 'spec_helper'

describe BatchFactory::Worksheet do
  describe '#initialize' do
    context 'given a file path with extension' do
      subject { -> { described_class.new(VALID_SPREADSHEET_XLS) } }
      it { is_expected.not_to raise_error }

      context 'w/ sheet_number option' do
        subject { described_class.new(VALID_SPREADSHEET_XLS) }
        its(:name) { should eq 'Sheet1' }
      end

      context 'with sheet_number option' do
        subject { described_class.new(VALID_SPREADSHEET_XLS, sheet_number: 2) }
        its(:name) { should eq 'Sheet3' }
      end
    end

    context 'given a file path w/ extension' do
      context 'w/ extension option' do
        subject { -> { described_class.new(VALID_SPREADSHEET) } }
        it { is_expected.to raise_error }
      end

      context 'with extension option' do
        subject { -> { described_class.new(VALID_SPREADSHEET, extension: 'xls') } }
        it { is_expected.not_to raise_error }
      end
    end
  end
end

