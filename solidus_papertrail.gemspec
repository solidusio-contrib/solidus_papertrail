# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'solidus_papertrail/version'

 Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_papertrail'
  s.version     = SolidusPapertrail::VERSION
  s.summary     = 'Solidus Papertrail integration'
  s.description = 'Views to see Order, Payment and Shipment Papertrail versions'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Acid Labs'
  s.email     = 'spree@acid.cl'
  s.homepage  = 'http://acid.cl'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'solidus_backend', [">= 1.0", "< 3"]
  s.add_dependency 'solidus_support'
  s.add_dependency 'paper_trail', '~> 7.0'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'rspec-rails',  '~> 3'
  s.add_development_dependency 'sqlite3'
end
