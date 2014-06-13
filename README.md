# Duolingo [![Build Status](https://travis-ci.org/Adam89/duolingo.svg?branch=master)](https://travis-ci.org/Adam89/duolingo)

Duolingo is a wrapper gem for the duolingo api. It allows
you to query the api for a particular users details.

## Installation

Add this line to your application's Gemfile:

    gem 'duolingo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install duolingo

## Usage

The information you can get with this gem are listed below:

* **get_all_info** - This gives you back an array containing all the users basic information
```ruby
username = "Novohispano"
user = Duolingo::User.new(username)
user.get_all_info
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/duolingo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
