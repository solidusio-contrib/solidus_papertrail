# frozen_string_literal: true

$:.push File.expand_path('lib', __dir__)
require 'solidus_papertrail/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_papertrail'
  s.version     = SolidusPapertrail::VERSION
  s.summary     = 'Solidus Papertrail integration'
  s.description = 'Views to see Order, Payment and Shipment Papertrail versions'

  s.required_ruby_version = '~> 2.4'

  s.author    = 'Acid Labs'
  s.email     = 'spree@acid.cl'
  s.homepage  = 'https://github.com/solidusio-contrib/solidus_papertrail'
  s.license   = 'BSD-3-Clause'

  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.test_files = Dir['spec/**/*']
  s.bindir = "exe"
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  if s.respond_to?(:metadata)
    s.metadata["homepage_uri"] = s.homepage if s.homepage
    s.metadata["source_code_uri"] = s.homepage if s.homepage
  end

  s.add_dependency 'paper_trail', '>= 9.2', '< 13.0'
  s.add_dependency 'solidus_core', ['>= 1.0', '< 3']
  s.add_dependency 'solidus_support', '~> 0.5'

  s.add_development_dependency 'solidus_dev_support'
end
