require 'cucumber/wire/plugin'

module Cucumber
  module Wire
    describe Plugin do
      def stub_wire_file!(filename, config)
        allow(Configuration).to receive(:from_file).with(filename) { config }
      end

      describe "#load_code_file" do
        before(:each) do
          stub_wire_file! 'foo.wire', :config
        end

        it "creates a RemoteSteps object" do
          expect(Connection).to receive(:new).with(:config)

          Plugin.new.load_code_file('foo.wire')
        end
      end

      describe "#step_matches" do
        def stub_remote_steps!(config, attributes)
          expect(Connection).to receive(:new).with(config) { double('remote_steps', attributes) }
        end

        before(:each) do
          stub_wire_file! 'one.wire', :config_one
          stub_wire_file! 'two.wire', :config_two
        end

        it "returns the matches from each of the RemoteSteps" do
          stub_remote_steps! :config_one, :step_matches => [:a, :b]
          stub_remote_steps! :config_two, :step_matches => [:c]

          plugin = Plugin.new
          plugin.load_code_file('one.wire')
          plugin.load_code_file('two.wire')

          expect(plugin.step_matches('','')).to eq [:a, :b, :c]
        end
      end
    end
  end
end
