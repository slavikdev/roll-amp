# APIs to simplify AMP implementation in Rails app
This gem is intended to contain any helpful API related
to Accelerated Mobile Pages (AMP). It’s specifically designed
to work with Rails.

[![Travis Build Status](https://travis-ci.org/roll-rails/roll-amp.svg?branch=master)](https://travis-ci.org/roll-rails/roll-amp)
[![Appveyor Build Status](https://ci.appveyor.com/api/projects/status/4i4t22ggmecnkg6k?svg=true)](https://ci.appveyor.com/project/slavikdev/roll-amp)
[![Test Coverage](https://codeclimate.com/github/roll-rails/roll-amp/badges/coverage.svg)](https://codeclimate.com/github/roll-rails/roll-amp/coverage)
[![Code Climate](https://codeclimate.com/github/roll-rails/roll-amp/badges/gpa.svg)](https://codeclimate.com/github/roll-rails/roll-amp)
[![Issue Count](https://codeclimate.com/github/roll-rails/roll-amp/badges/issue_count.svg)](https://codeclimate.com/github/roll-rails/roll-amp)

## Platforms
Minimum supported MRI version is `2.2.6`. JRuby is not supported.
The gem should work on Mac, Linux and Windows, however testing
is limited as follows:
* Mac OS X (development machine)
  * `2.4.0`
* Windows (via appveyor)
  * `2.3.3`
  * `2.2.6`
* Ubuntu (via travis-ci)
  * `2.4.0`
  * `2.3.3`
  * `2.2.6`
  * `Head`

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'roll-amp'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install roll-amp

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests. You can also run `bin/console`
for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`,
and then run `bundle exec rake release`, which will create a git tag for
the version, push git commits and tags, and push the `.gem`
file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub
at https://github.com/roll-rails/roll-amp. This project is intended to be
a safe, welcoming space for collaboration, and contributors are expected
to adhere to the [Contributor Covenant](http://contributor-covenant.org)
code of conduct.


## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
