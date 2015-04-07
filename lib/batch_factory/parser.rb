module BatchFactory
  class Parser
    attr_accessor :worksheet, :user_heading_keys,
      :heading_keys, :column_bounds, :row_hashes

    def initialize
      @heading_keys = []
      @column_bounds = []
      @row_hashes = []
    end

    def open(file_location, options = {})
      @worksheet = SpreadsheetDocument.new(file_location, options)
      @user_heading_keys = options[:keys]
    end

    def parse!
      @hashed_worksheet = nil

      parse_column_bounds
      parse_heading_keys
      parse_data_rows
    end

    def parse_heading_keys
      @heading_keys = user_heading_keys || worksheet.row(worksheet.first_row).map do |key|
        key.blank? ? nil : key.strip
      end
    end

    def parse_column_bounds
      @column_bounds = (@worksheet.first_column-1)..(@worksheet.last_column-1)
    end

    def parse_data_rows
      @row_hashes = []

      first_row_offset = user_heading_keys ? 0 : 1

      rows_range = ((worksheet.first_row+first_row_offset)..worksheet.last_row)
      rows_range.each do |idx|
        row = worksheet.row(idx)
        hash = HashWithIndifferentAccess.new

        for cell_index in @column_bounds
          if key = @heading_keys[cell_index] and
            value = row[cell_index]

            hash[key] = value if value.present?
          end
        end

        @row_hashes << hash unless hash.empty?
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
