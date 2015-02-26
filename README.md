# Matchdoc

Provides a template against which a string can be matched, particularly in RSpec

For longer strings it's not always possible or desirable to know the exact 
output of the string - you might know that every line in a file shoudld 
contain a price, but not what that price will be.  This provides an RSpec 
matcher for that exact problem.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'matchdoc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install matchdoc

## Usage

To specify a template construct a string (probably with a heredoc) with
embedded Regex where you want dynamic content.  If you are wanting to match a
list of 3 product SKUs and prices, you might do this.

```ruby
<<-LIST
product_sku, price
#{/[A-Z]{13}/}, #{/\$(\d)[1,2]\.\d\d}
#{/[A-Z]{13}/}, #{/\$(\d)[1,2]\.\d\d}
#{/[A-Z]{13}/}, #{/\$(\d)[1,2]\.\d\d}
LIST
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/matchdoc/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
