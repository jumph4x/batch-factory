module BatchFactory
  class Parser
    attr_accessor :worksheet, :heading_keys, :column_bounds, :row_hashes
  
    def initialize
      @heading_keys = []
      @column_bounds = []
      @row_hashes = []
    end
  
    def open file_location
      workbook = Spreadsheet.open File.open(file_location)
      @worksheet = workbook.worksheet(0)
    end
    
    def parse!
      @hashed_worksheet = nil
    
      parse_column_bounds
      parse_heading_keys
      parse_data_rows
    end
    
    def parse_heading_keys
      @heading_keys = worksheet.row(0).map do |key|
        key.blank? ? nil : key.strip
      end
    end
    
    def parse_column_bounds
      @column_bounds = [@worksheet.dimensions[2], @worksheet.dimensions[3]-1]
    end
    
    def parse_data_rows
      @row_hashes = []
      
      worksheet.each(1) do |row|
        hash = HashWithIndifferentAccess.new
        
        for cell_index in @column_bounds[0]..@column_bounds[1]
          if key = @heading_keys[cell_index] and
            value = row[cell_index]
            
            hash[key] = sanitize_value value if value.present?
          end
        end
        
        @row_hashes << hash unless hash.empty?
      end
    end
    
    def sanitize_value value
      if value.is_a? Spreadsheet::Formula
        value.value
      else
        value.to_s.strip
      end
    end
    
    def hashed_worksheet
      @hashed_worksheet ||= HashedWorksheet.new(
        @heading_keys,
        @row_hashes
      )
    end
    
  end
end
