require 'cucumber/wire/plugin'

AfterConfiguration do |config|
  plugin = Cucumber::Wire::Plugin.new(config)
  wire_files = config.send(:require_dirs).map { |dir| Dir.glob("#{dir}/**/*.wire") }.flatten
  wire_files.each do |wire_file|
    plugin.load_code_file(wire_file)
  end
  config.filters << Cucumber::Filters::ActivateSteps.new(plugin)
end
