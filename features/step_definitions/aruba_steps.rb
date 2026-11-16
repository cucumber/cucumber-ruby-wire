# frozen_string_literal: true

require 'aruba/cucumber'

# Aruba 3's `with exactly:` compares raw output, which always ends in a newline that a docstring cannot express
Then(/^it should (pass|fail) with exact output:$/) do |pass_fail, expected|
  last_command_started.stop

  if pass_fail == 'pass'
    expect(last_command_stopped).to be_successfully_executed
  else
    expect(last_command_stopped).not_to be_successfully_executed
  end

  expect(last_command_stopped).to have_output("#{expected}\n")
end
