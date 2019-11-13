# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$:.unshift lib unless $:.include?(lib)

require 'solidus_papertrail/version'

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
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
  s.require_path  = 'lib'
  s.requirements << 'none'

  s.add_dependency 'deface', '~> 1.3'
  s.add_dependency 'paper_trail', ['>= 7.0', '< 11']
  s.add_dependency 'solidus_backend', [">= 1.0", "< 3"]
  s.add_dependency 'solidus_support'

  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'solidus_extension_dev_tools'
end
