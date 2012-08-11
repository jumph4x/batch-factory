require 'roo'
class SpreadsheetDocument
  def initialize(file_name, sheet_number)
    @spreadsheet = case file_name.split('.').last
      when 'xls'
        Excel.new(file_name)
      when 'xlsx'
        Excelx.new(file_name)
      when 'ods'
        Openoffice.new(file_name)
      else
        Csv.new(file_name)
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
