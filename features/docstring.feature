Feature: Wire protocol docstrings

  In order to use docstrings as arguments to step definitions, we send them as
  an additional argument after the arguments extracted by the wire server.

  Background:
    Given a file named "features/step_definitions/some_remote_place.wire" with:
      """
      host: localhost
      port: 54321
      """
    And a file named "features/step_definitions/require_wire.rb" with:
    """
    require 'cucumber/wire'
    """

  Scenario: Run a scenario
    Given a file named "features/wired.feature" with:
      """
      Feature: High strung
        Scenario: Wired
          Given we're all wired
            \"\"\"
            to want more
            \"\"\"
      """
    And there is a wire server running on port 54321 which understands the following protocol:
      | request                                              | response                            |
      | ["step_matches",{"name_to_match":"we're all wired"}] | ["success",[{"id":"1", "args":[]}]] |
      | ["begin_scenario"]                                   | ["success"]                         |
      | ["invoke",{"id":"1","args":["to want more"]}]        | ["success"]                         |
      | ["end_scenario"]                                     | ["success"]                         |
    When I run `cucumber -f progress --publish-quiet`
    Then the stderr should not contain anything
    And it should pass with:
      """
      .

      1 scenario (1 passed)
      1 step (1 passed)
      """
