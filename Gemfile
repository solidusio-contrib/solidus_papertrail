source "https://rubygems.org"

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem "solidus", git: 'https://github.com/solidusio/solidus.git', branch: branch
gem "solidus_auth_devise"
gem 'deface'

if branch < "v2.5"
  gem 'factory_bot', '4.10.0', group: :test
else
  gem 'factory_bot', '> 4.10.0', group: :test
end

if ENV['DB'] == 'mysql'
  gem 'mysql2', '~> 0.4.10'
else
  gem 'pg', '~> 0.21'
end

group :development, :test do
  gem "pry-rails"
end

gemspec
