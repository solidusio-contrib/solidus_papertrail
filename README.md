SolidusPapertrail
=================

[![CircleCI](https://circleci.com/gh/solidusio-contrib/solidus_papertrail.svg?style=svg)](https://circleci.com/gh/solidusio-contrib/solidus_papertrail)

Introduction goes here.

Installation
------------

Add solidus_papertrail to your Gemfile:

```ruby
gem 'solidus_papertrail'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g solidus_papertrail:install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake default
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'solidus_papertrail/factories'
```


Copyright (c) 2014 [Acid Labs][acidlabs], released under the New BSD License

[acidlabs]: https://github.com/acidlabs
