# frozen_string_literal: true

require 'rubygems'
require 'bundler'
Bundler::GemHelper.install_tasks

task default: %i[unit_tests acceptance_tests]

desc 'Unit tests for Cucumber Ruby Wire'
task :unit_tests do
  sh 'bundle exec rspec'
end

desc 'Acceptance tests for Cucumber Ruby Wire'
task :acceptance_tests do
  sh 'bundle exec cucumber'
end
