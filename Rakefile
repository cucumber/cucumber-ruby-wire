# frozen_string_literal: true

require 'rubygems'
require 'bundler'
Bundler::GemHelper.install_tasks

task default: %i[unit_tests acceptance_tests]

task :unit_tests do
  sh 'bundle exec rspec'
end

task :acceptance_tests do
  sh 'bundle exec cucumber'
end
