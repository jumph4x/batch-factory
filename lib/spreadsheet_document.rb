require 'roo'
class SpreadsheetDocument
  def initialize(file_name, sheet_number)
    @spreadsheet = case file_name.split('.').last
      when 'xls'
        Roo::Excel.new(file_name)
      when 'xlsx'
        Roo::Excelx.new(file_name)
      when 'ods'
        Roo::Openoffice.new(file_name)
      else
        Roo::CSV.new(file_name)
    end
    @current_sheet = @spreadsheet.sheets[sheet_number]
  end

  def method_missing(method, *args, &block)
    if @spreadsheet.respond_to? method.to_sym
      args << @current_sheet
      @spreadsheet.send(method, *args, &block)
    else
      super
    end
  end
end
