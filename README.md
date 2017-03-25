# AMP in Rails apps
Utilities to simplify Accelerated Mobile Pages (AMP) implementation in Rails apps.

[![Travis Build Status](https://travis-ci.org/roll-rails/roll-amp.svg?branch=master)](https://travis-ci.org/roll-rails/roll-amp)
[![Appveyor Build Status](https://ci.appveyor.com/api/projects/status/4i4t22ggmecnkg6k?svg=true)](https://ci.appveyor.com/project/slavikdev/roll-amp)
[![Test Coverage](https://codeclimate.com/github/roll-rails/roll-amp/badges/coverage.svg)](https://codeclimate.com/github/roll-rails/roll-amp/coverage)
[![Code Climate](https://codeclimate.com/github/roll-rails/roll-amp/badges/gpa.svg)](https://codeclimate.com/github/roll-rails/roll-amp)
[![Issue Count](https://codeclimate.com/github/roll-rails/roll-amp/badges/issue_count.svg)](https://codeclimate.com/github/roll-rails/roll-amp)

## Features
Implemented:
* Tag to include AMP boilerplate CSS.
* Tag to include AMP base JS.
* Tag to include custom CSS.
* Google Analytics integration.

Todo:
* AMP validation via Ruby tests.
* ...

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
* [Documentation on RubyDoc](http://www.rubydoc.info/gems/roll-amp/)
* [How to setup AMP layout for Rails app pages](https://github.com/roll-rails/roll-amp/wiki/How-to-setup-AMP-layout-for-Rails-app-pages)

### Include main JS
```
<%= amp_js %>
```
Includes `https://cdn.ampproject.org/v0.js` script at a place where the `amp_js`
tag was specified.
This tag is required for AMP.

### Include boilerplate CSS
```
<%= amp_boilerplate %>
```
Includes basic CSS suggested at https://www.ampproject.org/docs/get_started/create/basic_markup

### Include custom CSS
1. Create CSS (SASS, SCSS) file under `app/stylesheets` of your Rails app.
For example `app/stylesheets/amp/application.scss`.
2. Add the following line to your AMP layout:
```
<%= amp_custom_style('amp/application') %>
```
When `amp/application` is available in the assets pipeline,
its content will be loaded from there. Otherwise such file will be searched in
the `public` directory.
Usually it’s sufficient to create CSS file and Rails will handle the rest.
*Please note, AMP sets 50K limit on CSS size. If you include larger stylesheet
your pages won’t be valid.*

### Google Analytics
1. Insert the following tag *before* `amp_js`:
```
<%= amp_analytics_js %>
```
2. Add analytics configuration to the *body*:
```
<%=
  amp_google_analytics(
    'UA-00000-1',
    {
      trackPageview: {
        on: 'visible',
        request: 'pageview'
      }
    }
  )
%>
```
First parameter is Google Analytics account ID.
Second parameter defines triggers. Please see [Adding Analytics to your AMP pages](https://developers.google.com/analytics/devguides/collection/amp-analytics/)
to learn about triggers. The example above shows the most common configuration.


### Layout example
```html
<!doctype html>
<html ⚡>
  <head>
    <%= amp_analytics_js %>
    <%= amp_js %>
    <%= csrf_meta_tags %>
    <%= amp_boilerplate %>
    <%= amp_custom_style('amp/application') %>
  </head>
  <body>
    <%=
      amp_google_analytics(
        'UA-00000-1',
        {
          trackPageview: {
            on: 'visible',
            request: 'pageview'
          }
        }
      )
    %>
    <%= yield %>
  </body>
</html>
```

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
