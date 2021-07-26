source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec

if ENV['CUCUMBER_RUBY_CORE']
  gem 'cucumber-core', path: ENV['CUCUMBER_RUBY_CORE']
elsif !ENV['CUCUMBER_USE_RELEASED_GEMS']
  gem 'cucumber-core', github: 'cucumber/cucumber-ruby-core', branch: 'main'
end

if ENV['CUCUMBER_RUBY']
  gem 'cucumber', path: ENV['CUCUMBER_RUBY']
elsif !ENV['CUCUMBER_USE_RELEASED_GEMS']
  gem 'cucumber', github: 'cucumber/cucumber-ruby', branch: 'remove-wire-dependency'
end

gem 'aruba', github: 'cucumber/aruba', branch: 'main' # Waiting for a new release of aruba