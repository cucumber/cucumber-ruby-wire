# frozen_string_literal: true

require 'cucumber/wire/exception'
require 'cucumber/wire/configuration'

describe Cucumber::Wire::Exception do
  subject(:exception) { described_class.new(data, config) }

  let(:config) { Cucumber::Wire::Configuration.new('host' => 'localhost', 'port' => 54_321) }

  describe 'with just a message' do
    let(:data) { { 'message' => 'foo' } }

    it '#to_s as expecteds' do
      expect(exception.to_s).to eq('foo')
    end
  end

  describe 'with a message and an exception' do
    let(:data) { { 'message' => 'foo', 'exception' => 'Bar' } }

    it '#to_s as expecteds' do
      expect(exception.to_s).to eq('foo')
    end

    it '#class.to_s returns the name of the exception' do
      expect(exception.class.to_s).to eq('Bar from localhost:54321')
    end
  end

  describe 'with a custom backtrace' do
    let(:data) { { 'message' => 'foo', 'backtrace' => %w[foo bar baz] } }

    it '#backrace returns the custom backtrace' do
      expect(exception.backtrace).to eq(%w[foo bar baz])
    end
  end
end
