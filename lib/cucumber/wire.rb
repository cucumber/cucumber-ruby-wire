require 'cucumber/wire/plugin'

AfterConfiguration do |config, registry|
  Cucumber::Wire::Plugin.new(config, registry).install
end
