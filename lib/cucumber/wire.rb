require 'cucumber/wire/plugin'

return unless respond_to?(:InstallPlugin)

InstallPlugin do |config, registry|
  Cucumber::Wire::Plugin.new(config, registry).install
end
