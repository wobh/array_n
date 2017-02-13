# ArrayN

Multidimensional Arrays in Ruby.

A simple class that provides multidimensional readers and accessors to
what is, internally, a flat array.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'array_n'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install array_n

## Usage

Initialize with dimensions of array:

```ruby
3dary = ArrayN.new(2, 3, 5)
```

Use a block to set array values:

```ruby
3dary = ArrayN.new(2, 3, 5) { |n| n + 1 }
```

Get number of elements of the array with `#length` or `#size`:

```ruby
3dary.length #=> [2, 3, 5]
```

Get the dimensionality of the array with `#rank`:

```ruby
3dary.rank #=> 3
```

Find out if an array of subscripts is valid with `#in_bounds?`:

```ruby
3dary.in_bounds?(0, 1, 3) #=> true
```

Find the corresponding index of array coordinates with
`#row_major_index`:

```ruby
3dary.row_major_index(0, 1, 3) #=> 8
```

Fetch an element of the array with `#fetch`:

```ruby
3dary.fetch(0, 1, 3) #=> 9
```

Store an element to the array with `#store`:

```ruby
3dary.store(:foo, 0, 1, 3) #=> :foo
```

Return equivalent nested array with `.to_a`:

```ruby
3dary.to_a #=> [[[1, 2, 3, 4, 5],
           #     [6, 7, 8, :foo, 10],
           #     [11, 12, 13, 14, 15]],
           #    [[16, 17, 18, 19, 20],
           #     [21, 22, 23, 24, 25],
           #     [26, 27, 28, 29, 30]]]
```

`ArrayN` includes `Enumerable` and implements an `#each`, so instances
can be used more-or-less like any other.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/array_n. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

