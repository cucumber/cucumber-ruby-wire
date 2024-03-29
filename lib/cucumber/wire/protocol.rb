# frozen_string_literal: true

require 'cucumber/wire/protocol/requests'

module Cucumber
  module Wire
    module Protocol
      def step_matches(name_to_match, registry)
        handler = Requests::StepMatches.new(self, registry)
        handler.execute(name_to_match)
      end

      def snippet_text(step_keyword, step_name, multiline_arg_class_name)
        handler = Requests::SnippetText.new(self)
        handler.execute(step_keyword, step_name, multiline_arg_class_name)
      end

      def invoke(step_definition_id, args)
        handler = Requests::Invoke.new(self)
        handler.execute(step_definition_id, args)
      end

      def diff_failed
        handler = Requests::DiffFailed.new(self)
        handler.execute
      end

      def diff_ok
        handler = Requests::DiffOk.new(self)
        handler.execute
      end

      def begin_scenario(scenario)
        handler = Requests::BeginScenario.new(self)
        handler.execute(scenario)
      end

      def end_scenario(scenario)
        handler = Requests::EndScenario.new(self)
        handler.execute(scenario)
      end
    end
  end
end
