# frozen_string_literal: true

require 'cucumber/wire/connection'
require 'cucumber/wire/configuration'

describe Cucumber::Wire::Connection do
  subject(:connection) { test_connection.new(config) }

  let(:test_connection) do
    Class.new(described_class) do
      attr_accessor :socket
    end
  end
  let(:test_configuration) do
    Class.new do
      attr_reader :custom_timeout

      def initialize
        @custom_timeout = {}
      end

      def timeout(message = nil)
        return :default_timeout if message.nil?

        @custom_timeout[message] || Cucumber::Wire::Configuration::DEFAULT_TIMEOUTS.fetch(message)
      end

      def host
        'localhost'
      end

      def port
        '3902'
      end
    end
  end
  let(:socket) { double('socket').as_null_object }
  let(:config) { test_configuration.new }

  before(:each) { connection.socket = socket }

  it 're-raises a timeout error' do
    allow(Timeout).to receive(:timeout).and_raise(Timeout::Error.new(''))

    expect { connection.call_remote(nil, :foo, []) }.to raise_error(Timeout::Error)
  end

  it 'ignores timeout errors when configured to do so' do
    config.custom_timeout[:foo] = :never

    allow(socket).to receive(:gets).and_return('["response"]')

    handler = double(handle_response: :response)

    expect(connection.call_remote(handler, :foo, [])).to eq(:response)
  end

  it 'raises an exception on remote connection closed' do
    config.custom_timeout[:foo] = :never
    allow(socket).to receive(:gets)

    expect { connection.call_remote(nil, :foo, []) }.to raise_error(Cucumber::Wire::Exception, 'Remote Socket with localhost:3902 closed.')
  end
end
