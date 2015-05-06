# Factory

Class 'Factory' which has the same behavior as 'Struct' class.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'factory', :git => "git://github.com/x103103/factory"
```

## Usage

```ruby

require 'factory'

Book = Factory::Factory.new(:title, :author)

book = Book.new "Fight Club", "Chuck Palahniuk"
puts book.title
puts book.author

```

