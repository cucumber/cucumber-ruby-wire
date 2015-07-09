require 'cucumber/wire/plugin'

AfterConfiguration do |config|
  # TODO
  Cucumber::Wire::Plugin.new(config)
end
