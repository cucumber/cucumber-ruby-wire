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
  s.required_ruby_version = '>= 2.6'
  s.rubygems_version = '>= 3.0.3'

  s.add_dependency 'cucumber-core', '~> 10.1', '>= 10.1.0'
  s.add_dependency 'cucumber-cucumber-expressions', '> 14', '< 18'

  s.add_development_dependency 'aruba', '~> 2.0'
  s.add_development_dependency 'cucumber', '> 7.1', '< 10'
  s.add_development_dependency 'rake', '~> 13.1'
  s.add_development_dependency 'rspec', '~> 3.12'

  s.test_files = Dir['spec/**/*']
  s.files = Dir['CHANGELOG.md', 'CHANGELOG.old.md', 'CONTRIBUTING.md', 'README.md', 'LICENSE', 'lib/**/*']
  s.rdoc_options     = ['--charset=UTF-8']
  s.require_path     = 'lib'
end
