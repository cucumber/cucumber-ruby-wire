# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

Gem::Specification.new do |s|
  s.name        = 'cucumber-wire'
  s.version     = File.read("#{__dir__}/VERSION")
  s.authors     = ['Matt Wynne', 'Aurelien Reeves', 'Luke Hill']
  s.description = 'Wire protocol for Cucumber'
  s.summary     = "cucumber-wire-#{s.version}"
  s.email       = 'cukes@googlegroups.com'
  s.homepage    = 'http://cucumber.io'
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'
  s.required_ruby_version = '>= 3.2'
  s.required_rubygems_version = '>= 3.2.8'

  s.add_dependency 'cucumber-core', '>= 16.2', '< 17'
  s.add_dependency 'cucumber-cucumber-expressions', '> 17', '< 20'

  s.add_development_dependency 'aruba', '~> 2.2'
  s.add_development_dependency 'cucumber', '> 8', '< 12'
  s.add_development_dependency 'rake', '~> 13.3'
  s.add_development_dependency 'rspec', '~> 3.13'
  s.add_development_dependency 'rubocop', '~> 1.84.0'
  s.add_development_dependency 'rubocop-packaging', '~> 0.6.0'
  s.add_development_dependency 'rubocop-performance', '~> 1.26.0'
  s.add_development_dependency 'rubocop-rake', '~> 0.7.1'
  s.add_development_dependency 'rubocop-rspec', '~> 3.8.0'

  s.files = Dir['CHANGELOG.md', 'README.md', 'LICENSE', 'lib/**/*']
  s.rdoc_options     = ['--charset=UTF-8']
  s.require_path     = 'lib'
end
