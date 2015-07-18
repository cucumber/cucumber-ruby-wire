require 'cucumber/wire/connections'
require 'cucumber/wire/add_hooks_filter'

module Cucumber
  module Wire
    class Plugin
      attr_reader :config
      private :config

      def initialize(config)
        @config = config
      end

      def install
        connections = Connections.new(wire_files.map { |wire_file| create_connection(wire_file) })
        config.filters << Filters::ActivateSteps.new(connections, @config)
        config.filters << AddHooksFilter.new(connections) unless @config.dry_run?
        config.register_snippet_generator Snippet::Generator.new(connections)
      end

      def create_connection(wire_file)
        Connection.new(Configuration.from_file(wire_file))
      end

      def wire_files
        # TODO: change Cucumber's config object to allow us to get this information
        config.send(:require_dirs).map { |dir| Dir.glob("#{dir}/**/*.wire") }.flatten
      end
    end
  end
end
