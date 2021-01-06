# Cron::Parser
Cron Parser is you bestest friend!


### Testing
```
$ rake
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cron-parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cron-parser

## Usage

Script deciphers cron commands
```
$ ./bin/cron-parser '0 0 1 1 * /bin/sh'

minute       0
hour         0
day of month 1
month        1
day of week  0 1 2 3 4 5 6
command      /bin/sh
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ivankukobko/cron-parser.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
