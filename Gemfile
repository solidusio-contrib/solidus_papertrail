# frozen_string_literal: true

source "https://rubygems.org"

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem "solidus", git: 'https://github.com/solidusio/solidus.git', branch: branch
gem 'solidus_auth_devise', '~> 2.0'

# Needed to help Bundler figure out how to resolve dependencies,
# otherwise it takes forever to resolve them
if branch == 'master' || Gem::Version.new(branch[1..-1]) >= Gem::Version.new('2.10.0')
  gem 'rails', '~> 6.0'
else
  gem 'rails', '~> 5.0'
end

case ENV['DB']
when 'mysql'
  gem 'mysql2'
when 'postgresql'
  gem 'pg'
else
  gem 'sqlite3'
end

gem 'solidus_extension_dev_tools', github: 'solidusio-contrib/solidus_extension_dev_tools'

gemspec
