# Batch Factory

Built on top of the Spreadsheet gem by Zeno R.R. Davatz for easy abstraction of Excel spreadsheets as tabular data input. Assumes the first row to be headings with keys and forms clean Ruby hashmaps for all consecutive rows using cells as values for respective keys. 

## Uses

Common scenarios include:

* Batch creates\updates\deletes through an ORM (ActiveRecord, DataMapper, Mongoid, anything that accepts hashes for a given record)

## Usage

```ruby
require 'batch_factory'
```

## Installation

```ruby
gem install batch_factory
```

Or in a Gemfile if you always want the freshest cut:
```ruby
gem 'batch_factory', :git => 'git://github.com/jumph4x/batch-factory.git'
```

## Why?

Because the business world still runs on spreadsheets and Excel. This allows high thinking executives effectively to interact with your software library or webapp. 
