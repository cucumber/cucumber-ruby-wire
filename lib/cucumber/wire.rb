require 'cucumber/wire/plugin'

InstallPlugin do |config, registry|
  Cucumber::Wire::Plugin.new(config, registry).install
end
