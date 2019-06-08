# AutoSqlFormatter
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'auto_sql_formatter'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install auto_sql_formatter

## Usage

```rb
require 'auto_sql_formatter'

# In your irb concole

AutoSqlFormatter.execute dir_path # default = app
# ========Start to format sql=========

# SSS..

# example/example2.rb  success
# example/example3.rb  success
# example/example.rb  success
# example/example4.rb  none
# example/example5.rb  none

# ===========Completed!!!============

# Or bundle exec auto_sql_formatter dir
bundle exec sql_format

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tashirosota/ruby-export_strings. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
