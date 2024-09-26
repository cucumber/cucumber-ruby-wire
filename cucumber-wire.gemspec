# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

Gem::Specification.new do |s|
  s.name        = 'cucumber-wire'
  s.version     = File.read("#{__dir__}/VERSION")
  s.authors     = ['Matt Wynne']
  s.description = 'Wire protocol for Cucumber'
  s.summary     = "cucumber-wire-#{s.version}"
  s.email       = 'cukes@googlegroups.com'
  s.homepage    = 'http://cucumber.io'
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'
  s.required_ruby_version = '>= 3.0'
  s.required_rubygems_version = '>= 3.2.8'

  s.add_dependency 'cucumber-core', '> 11', '< 15'
  s.add_dependency 'cucumber-cucumber-expressions', '> 14', '< 18'

  s.add_development_dependency 'aruba', '~> 2.2'
  s.add_development_dependency 'cucumber', '> 8', '< 10'
  s.add_development_dependency 'rake', '~> 13.2'
  s.add_development_dependency 'rspec', '~> 3.13'
  s.add_development_dependency 'rubocop', '~> 1.66.1'
  s.add_development_dependency 'rubocop-packaging', '~> 0.5.2'
  s.add_development_dependency 'rubocop-performance', '~> 1.22.1'
  s.add_development_dependency 'rubocop-rake', '~> 0.6.0'
  s.add_development_dependency 'rubocop-rspec', '~> 3.0.5'

  s.files = Dir['CHANGELOG.md', 'CHANGELOG.old.md', 'CONTRIBUTING.md', 'README.md', 'LICENSE', 'lib/**/*']
  s.rdoc_options     = ['--charset=UTF-8']
  s.require_path     = 'lib'
end
