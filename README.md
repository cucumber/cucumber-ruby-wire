[![Test cucumber-wire](https://github.com/cucumber/cucumber-ruby-wire/actions/workflows/test.yaml/badge.svg)](https://github.com/cucumber/cucumber-ruby-wire/actions/workflows/test.yaml)

# cucumber-wire

This gem was extracted from the [cucumber gem](https://github.com/cucumber/cucumber-ruby)

This is available as an optional runtime dependency for cucumber-ruby and also as a runtime dependency for cucumber cpp.

The tests here are a bit hairy and prone to the occasional flicker.

## Configuration

You can configure the connection using a YML file called a `.wire` file:

```yml
host: localhost
port: 54321
timeout:
  connect: 11
  invoke: 120
  begin_scenario: 120
  end_scenario: 120
```

### Timeouts

The default timeout is 120 seconds. `connect` has a default timeout of 11 seconds.

### YML with ERB templating

The file format is YAML, with ERB templating, so you could make the configuration configurable:

```yml,erb
host: localhost
port: 54321
timeout:
  connect: <%= (ENV['MY_CONNECT_TIMEOUT'] || 11).to_i %>
  invoke: 120
  begin_scenario: 120
  end_scenario: 120
```
