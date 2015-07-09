require 'multi_json'
require 'socket'
require 'cucumber/wire/connection'
require 'cucumber/wire/configuration'
require 'cucumber/wire/data_packet'
require 'cucumber/wire/exception'
require 'cucumber/wire/step_definition'
require 'cucumber/wire/snippet'
require 'cucumber/configuration'

module Cucumber
  module Wire

    # The wire-protocol (language independent) implementation of the programming
    # language API.
    class Plugin

      def initialize(configuration = Cucumber::Configuration.new)
        @connections = []
        configuration.register_snippet_generator Snippet::Generator.new(@connections)
      end

      def load_code_file(wire_file)
        config = Configuration.from_file(wire_file)
        @connections << Connection.new(config)
      end

      def step_matches(step_name, formatted_step_name)
        @connections.map{ |c| c.step_matches(step_name, formatted_step_name)}.flatten
      end

      def begin_scenario(scenario)
        @connections.each { |c| c.begin_scenario(scenario) }
        @current_scenario = scenario
      end

      def end_scenario
        scenario = @current_scenario
        @connections.each { |c| c.end_scenario(scenario) }
        @current_scenario = nil
      end

    end
  end
end
