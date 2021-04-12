source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec

def monorepo(name)
  return {} if ENV['CUCUMBER_RELEASED_GEMS']
  path = "../../cucumber/#{name}/ruby"
  if File.directory?(path)
    { path: File.expand_path(path) }
  else
    { git: "https://github.com/cucumber/cucumber", glob: "#{name}/ruby/cucumber-#{name}.gemspec" }
  end
end

def sibling(name)
  return {} if ENV['CUCUMBER_RELEASED_GEMS']
  path = "../#{name}"
  if File.directory?(path)
    { path: File.expand_path(path) }
  else
    # Sibling dependencies must use the same branch
    branch = ENV['CIRCLE_BRANCH']
    { git: "https://github.com/cucumber/#{name}.git", branch: branch }
  end
end

gem 'cucumber-core', sibling('cucumber-ruby-core')
gem 'cucumber-cucumber-expressions', monorepo('cucumber-expressions')
gem 'cucumber-html-formatter', monorepo('html-formatter')
gem 'cucumber-messages', monorepo('messages')

gem 'aruba'
gem 'cucumber', sibling('cucumber-ruby')
gem 'rake'
gem 'rspec'