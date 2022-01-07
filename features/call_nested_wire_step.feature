Feature: Call nested wire step

  @wip
  Scenario: Call a nested step over the wire
    Given a file named "features/step_definitions/remote.wire" with:
      """
      host: localhost
      port: 54321

      """
    And a file named "features/nested_step.feature" with:
      """
      Feature: Nested
        Scenario: Nested
          Given a ruby step that calls a nested step
      """
    And a file named "features/step_definitions/steps.rb" with:
      """
      Given "a ruby step that calls a nested step" do
        step "a nested step over the wire"
      end
      Given "a nested step over the wire" do
      end
      """
    And there is a wire server running on port 54321 which understands the following protocol:
      | request                                                                   | response                            |
      | ["step_matches",{"name_to_match":"a ruby step that calls a nested step"}] | ["success",[]]                      |
      | ["step_matches",{"name_to_match":"a nested step over the wire"}]          | ["success",[{"id":"1", "args":[]}]] |
      | ["begin_scenario"]                                                        | ["success"]                         |
      | ["invoke",{"id":"1","args":[]}]                                           | ["success"]                         |
      | ["end_scenario"]                                                          | ["success"]                         |
    When I run `cucumber -f progress`
    And it should pass with:
      """
      .

      1 scenario (1 passed)
      1 step (1 passed)

      """
