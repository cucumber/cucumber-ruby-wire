[![CircleCI](https://circleci.com/gh/cucumber/cucumber-ruby-wire.svg?style=svg)](https://circleci.com/gh/cucumber/cucumber-ruby-wire)

# cucumber-wire

This gem was extracted from the [cucumber gem](https://github.com/cucumber/cucumber-ruby), and remains a runtime dependency to that gem.

Its tests are a bit hairy and prone to the occasional flicker.

In the future, it may become an opt-in plugin rather than a direct dependency on every Cucumber.

## Configuration

You can configure the connection using a YAML file called a `.wire` file:

```yaml
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

### YAML with ERB templating

The file format is YAML, with ERB templating, so you could make the configuration configurable:

```yaml,erb
host: localhost
port: 54321
timeout:
  connect: <%= (ENV['MY_CONNECT_TIMEOUT'] || 11).to_i %>
  invoke: 120
  begin_scenario: 120
  end_scenario: 120
```
## Migration from built-in to plugin

Usage of built-in wire protocol with `cucumber-ruby` will be deprecated in cucumber
8.0.0, and removed in cucumber 9.0.0.

The wire protocol will still be available by explicitely using the `cucumber-wire`
gem.

### Before cucumber 8.0.0

Before cucumber 8.0.0, the wire protocol was automatically installed with cucumber,
and automatically activated when it had detected a `.wire` file.

### With cucumber 8.0.0

The wire protocol will work as before, but you will notice a deprecation message.

To prevent the deprecation message to be shown, add the gem `cucumber-wire` to your
Gemfile:

```ruby
# Gemfile

# some gems here...

gem "cucumber"
gem "cucumber-wire"

# other gems here

```

And add `require 'cucumber/wire'` in your support code. If you do not have support
code yet, create a new one. For example `features/support/env.rb`.

```ruby
# features/support/env.rb
require 'cucumber/wire'
```

The wire protocol will be installed, and no deprecation message will be shown anymore.

### With cucumber 9.0.0

The usage of the built-in wire protocol will be removed. You will have to install
`cucumber-wire` and add `require 'cucumber/wire'` in your support code in order
to continue using it, as explained [above](#with-cucumber-8-0-0).