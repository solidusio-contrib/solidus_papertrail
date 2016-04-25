# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_papertrail'
  s.version     = '2.1.4'
  s.summary     = 'Spree Papertrail integration'
  s.description = 'Views to see Order, Payment and Shipment Papertrail versions'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Acid Labs'
  s.email     = 'spree@acid.cl'
  s.homepage  = 'http://acid.cl'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_runtime_dependency 'solidus_core', ["~> 1.0"]
  s.add_runtime_dependency 'solidus_backend', ["~> 1.0"]
  s.add_dependency 'paper_trail', '~> 4.0.0'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'rspec-rails',  '~> 3'
  s.add_development_dependency 'sqlite3'
end
