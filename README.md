# Batch Factory

Built on top of the [roo](https://github.com/roo-rb/roo) gem for easy abstraction of Excel and OpenOffice spreadsheets as tabular data input. Assumes the first row to be headings with keys and forms clean Ruby hashmaps for all consecutive rows using cells as values for respective keys. 

## Uses

Common scenarios include:

* Batch creates\updates\deletes through an ORM (ActiveRecord, DataMapper, Mongoid, anything that accepts hashes for a given record)

## Usage
First,
```ruby
require 'batch_factory'
hash_worksheet = BatchFactory.from_file 'path/to/some/spreadsheet.xls'
```
To open particular sheet specify the `sheet_number` option.
By default it opens the first sheet (`sheet_number`: 0).
E.g this will open the second sheet:
```ruby
hash_worksheet = BatchFactory.from_file 'path/to/some/spreadsheet.xls', sheet_number: 1
```

If your data doesn't include headings, add them by passing an
optional array:
```ruby
hash_worksheet = BatchFactory.from_file 'path/to/some/spreadsheet.xls',
  keys: [:name, :address, :phone]
```

Spreadsheet type is detected by the file extension (`xls`, `xlsx`, `ods`),
files without extension considered `csv`.
Also, this can be specified explicitly with the `filetype` option:
```ruby
hash_worksheet = BatchFactory.from_file 'http://somecloud.com/path/spreadsheet', filetype: 'xls'
```

Then, display headings from row 1 that BatchFactory used as hash keys for each row:
```ruby
hash_worksheet.keys
```

Show all extracted hashes (one per row starting with row 2):
```ruby
hash_worksheet.rows
```

Iterate over it like an array (or enumerable). Or, in fact, any method that either respond to:
```ruby
hash_worksheet.each do |hash_row|
  puts hash_row.inspect
end
```

Note: this gem pulls in Activesupport's indefferent access for hashes, so you can access each row's data with Symbols just like Strings. Enjoy.

## Installation

```ruby
gem install batch_factory
```

Or in a Gemfile if you always want the freshest cut:
```ruby
gem 'batch_factory', :git => 'git://github.com/jumph4x/batch-factory.git'
```

## Why?

Because the business world still runs on spreadsheets and Excel. This allows executives to effectively interact with your software library or webapp. 

## Cred

A project by [Downshift Labs](http://downshiftlabs.com), Ruby on Rails,
Performance tuning and Spree Commerce projects.
