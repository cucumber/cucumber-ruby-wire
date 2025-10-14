# frozen_string_literal: true

task default: %i[unit_tests acceptance_tests]

task :unit_tests do
  sh 'bundle exec rspec'
end

task :acceptance_tests do
  sh 'bundle exec cucumber'
end
