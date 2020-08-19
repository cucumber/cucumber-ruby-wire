# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'cucumber-wire'
  s.version     = File.read(File.dirname(__FILE__) + '/lib/cucumber/wire/version').strip
  s.authors     = ['Matt Wynne']
  s.description = 'Wire protocol for Cucumber'
  s.summary     = "cucumber-wire-#{s.version}"
  s.email       = 'cukes@googlegroups.com'
  s.homepage    = 'http://cucumber.io'
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'
  s.required_ruby_version = '>= 2.3'

  s.add_dependency 'cucumber-core', '~> 8.0', '>= 8.0.1'
  s.add_dependency 'cucumber-cucumber-expressions', '~> 10.3', '>= 10.3.0'
  s.add_dependency 'cucumber-messages', '~> 13.0', '>= 13.0.1'

  s.add_development_dependency 'cucumber', '~> 4.1', '>= 4.1.0'
  s.add_development_dependency 'rake', '~> 13.0', '>= 13.0.1'
  s.add_development_dependency 'rspec', '~> 3.9', '>= 3.9.0'
  s.add_development_dependency 'aruba', '~> 1.0', '>= 1.0.2'

  s.rubygems_version = '>= 1.6.1'
  s.test_files            = Dir[
    'spec/**/*'
  ]
  s.files            = Dir[
    'CHANGELOG.md',
    'CONTRIBUTING.md',
    'README.md',
    'LICENSE',
    'lib/**/*'
  ]
  s.rdoc_options     = ['--charset=UTF-8']
  s.require_path     = 'lib'
end
