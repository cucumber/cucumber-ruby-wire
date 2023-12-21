# frozen_string_literal: true

require 'cucumber/wire/connections'
require 'cucumber/wire/configuration'

module Cucumber
  module Wire
    describe Connections do
      describe '#step_matches' do
        it 'returns the matches from each of the RemoteSteps' do
          connection1 = double(step_matches: [:a, :b])
          connection2 = double(step_matches: [:c])

          connections = described_class.new([connection1, connection2], double, double)
          expect(connections.step_matches('')).to eq([:a, :b, :c])
        end

        it 'copes with no connections' do
          connections = described_class.new([], double, double)
          expect(connections.step_matches('')).to eq([])
        end
      end
    end
  end
end
