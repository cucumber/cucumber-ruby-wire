# coding: utf-8

module Cucumber
  module Wire
    class AddHooksFilter < Core::Filter.new(:connections)
      def test_case(test_case)
        test_case.
          with_steps([before_hook(test_case)] + test_case.test_steps + [after_hook(test_case)]).
          describe_to receiver
      end

      def before_hook(test_case)
        # TODO: is this dependency on Cucumber::Hooks OK? Feels a bit internal..
        # TODO: how do we express the location of the hook? Should we create one hook per connection so we can use the host:port of the connection?

        hook = Cucumber::Glue::Hook.new(id_generator.new_id, Cucumber::Hooks::BeforeHook, [], ->(test_case) { connections.begin_scenario(test_case) })
        action = ->(result) { hook.invoke('Before', test_case.with_result(result)) }

        hook_step = Cucumber::Hooks.before_hook(id_generator.new_id, Core::Test::Location.new('TODO:wire')) do
          connections.begin_scenario(test_case)
        end

        configuration.event_bus.hook_test_step_created(hook_step, hook)

        hook_step
      end

      def after_hook(test_case)
        hook = Cucumber::Glue::Hook.new(id_generator.new_id, Cucumber::Hooks::AfterHook, [], ->(test_case) { connections.end_scenario(test_case) })
        action = ->(result) { hook.invoke('After', test_case.with_result(result)) }

        hook_step = Cucumber::Hooks.after_hook(id_generator.new_id, Core::Test::Location.new('TODO:wire')) do
          connections.end_scenario(test_case)
        end

        configuration.event_bus.hook_test_step_created(hook_step, hook)

        hook_step
      end

      def id_generator
        @id_generator ||= connections.configuration.id_generator
      end

      def configuration
        @configuration ||= connections.configuration
      end
    end
  end
end
