Feature: Call nested wire step

  If the user specifies a "nested" step in their Ruby step definitions, the
  search for that step definition should include steps defined over the wire.

  A nested step should still match and be invoked succesfully if it's defined
  over the wire.

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
	  Given a step over the wire
          Given a ruby step
      """
    And a file named "features/step_definitions/steps.rb" with:
      """
      Given "a ruby step" do
        step "a step over the wire"
      end
      """
    And there is a wire server running on port 54321 which understands the following protocol:
      | request                                                                   | response                            |
      | ["step_matches",{"name_to_match":"a ruby step"}] | ["success",[]]                      |
      | ["step_matches",{"name_to_match":"a step over the wire"}]          | ["success",[{"id":"1", "args":[]}]] |
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
