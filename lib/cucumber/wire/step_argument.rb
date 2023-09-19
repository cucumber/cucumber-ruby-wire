# frozen_string_literal: true
require 'cucumber/cucumber_expressions/group'

module Cucumber
  module Wire
    # Defines the location and value of a captured argument from the step
    # text
    class StepArgument
      attr_reader :offset

      def initialize(offset, val)
        @offset, @value = offset, val
      end

      def value(_current_world)
        @value
      end

      def group
        CucumberExpressions::Group.new(@value, @offset, @offset + @value.length, [])
      end

      def parameter_type
        # `Cucumber::Formatter::MessageBuilder` treats parameter_type as **required**
        # when building `Cucumber::Messages::StepMatchArgument` with `parameter_type_name` in method `step_match_arguments`,
        # though `parameterTypeName` of `StepMatchArgument` is not **required** according to
        # https://github.com/cucumber/messages/blob/main/messages.md#stepmatchargument
        # Here is workaround for this
        Class.new do
          def name
          end
        end.new
      end
    end
  end
end
