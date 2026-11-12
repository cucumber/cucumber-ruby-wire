# frozen_string_literal: true

require 'json'
require 'socket'

class FakeWireServer
  def initialize(port, protocol_table)
    @port = port
    @protocol_table = protocol_table
    @delays = {}
  end

  def run(io)
    @server = TCPServer.open(@port)
    loop { handle_connections(io) }
  end

  def delay_response(message, delay)
    @delays[message] = delay
  end

  private

  def handle_connections(io)
    Thread.start(@server.accept) { |socket| open_session_on socket, io }
  end

  def open_session_on(socket, io)
    on_message = lambda { |message| io.puts message }
    SocketSession.new(socket, @protocol_table, @delays, on_message).start
  rescue Exception => e
    raise e
  ensure
    socket.close
  end

  class SocketSession
    # Some messages may be sent by Cucumber unconditionally (e.g.
    # `snippet_text` is sent by Cucumber 11.x MessageBuilder on every undefined
    # step, regardless of `--no-snippets` or `--dry-run`). Return a neutral
    # success response so that individual scenarios do not need to enumerate
    # these in their protocol tables.
    IGNORABLE_MESSAGES = %w[snippet_text].freeze

    def initialize(socket, protocol, delays, on_message)
      @socket = socket
      @protocol = protocol
      @delays = delays
      @on_message = on_message
    end

    def start
      while message = @socket.gets
        handle(message)
      end
    end

    private

    def handle(data)
      if protocol_entry = response_to(data.strip)
        sleep delay(data)
        @on_message.call(JSON.parse(protocol_entry['request'])[0])
        send_response(protocol_entry['response'])
      elsif ignorable?(data.strip)
        send_response(['success', ''].to_json)
      else
        serialized_exception = { message: "Not understood: #{data}", backtrace: [] }
        send_response(['fail', serialized_exception].to_json)
      end
    rescue => e
      send_response(['fail', { message: e.message, backtrace: e.backtrace, exception: e.class }].to_json)
    end

    def response_to(data)
      @protocol.detect do |entry|
        JSON.parse(entry['request']) == JSON.parse(data)
      end
    end

    def send_response(response)
      @socket.puts("#{response}\n")
    end

    def delay(data)
      message = JSON.parse(data.strip)[0]
      @delays[message.to_sym] || 0
    end

    def ignorable?(data)
      IGNORABLE_MESSAGES.include?(JSON.parse(data)[0])
    end
  end
end
