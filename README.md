# Batch Factory

Built on top of the Spreadsheet gem by Zeno R.R. Davatz for easy abstraction of Excel spreadsheets as tabular data input. Assumes the first row to be headings with keys and forms clean Ruby hashmaps for all consecutive rows using cells as values for respective keys. 

## Uses

Common scenarios include:

* Batch creates\updates\deletes through an ORM (ActiveRecord, DataMapper, Mongoid, anything that accepts hashes for a given record)

## Usage
First,
```ruby
require 'batch_factory'
hash_worksheet = BatchFactory.from_file 'path/to/some/spreadsheet.xls'
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
