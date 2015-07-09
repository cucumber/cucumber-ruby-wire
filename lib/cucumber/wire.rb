require 'cucumber/wire/plugin'

module Cucumber
  module Wire
    class Installer
      attr_reader :config
      private :config

      def initialize(config)
        @config = config
      end

      def call
        plugin = Plugin.new(connections)
        config.filters << Filters::ActivateSteps.new(plugin)
        config.register_snippet_generator Snippet::Generator.new(connections)
      end

      def connections
        @connections ||= wire_files.map do |wire_file|
          Connection.new(Configuration.from_file(wire_file))
        end
      end

      def wire_files
        # TODO: change Cucumber's config object to allow us to get this information
        config.send(:require_dirs).map { |dir| Dir.glob("#{dir}/**/*.wire") }.flatten
      end
    end
  end
end

AfterConfiguration do |config|
  Cucumber::Wire::Installer.new(config).call
end
