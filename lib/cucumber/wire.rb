require 'cucumber/wire/plugin'

return unless defined?(InstallPlugin)

InstallPlugin do |config, registry|
  Cucumber::Wire::Plugin.new(config, registry).install
end
