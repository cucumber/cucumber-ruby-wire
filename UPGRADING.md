# Upgrading from 6.0.1 to 6.1.0

Usage of **built-in** wire protocol with `cucumber-ruby` will be deprecated in cucumber
7.1.0, and removed in cucumber 8.0.0.

The wire protocol will still be available by explicitely using the `cucumber-wire`
gem.

### Before cucumber 7.1.0

Before cucumber 7.1.0, the wire protocol was automatically installed with cucumber,
and automatically activated when it had detected a `.wire` file.

### With cucumber 7.1.0

The wire protocol will work as before, but you will notice a deprecation message.

To prevent the deprecation message to be shown, add the gem `cucumber-wire` to your
Gemfile alongside the `cucumber` one:

```ruby
# Gemfile

# ...

gem "cucumber"
gem "cucumber-wire"

# ...

```

Then install it:

```shell
bundle install
```

And add `require 'cucumber/wire'` in your support code. If you do not have support
code yet, create a new one. For example `features/support/wire.rb`.

```ruby
# features/support/wire.rb
require 'cucumber/wire'
```

The wire protocol will be installed, and no deprecation message will be shown anymore.

### With cucumber 8.0.0

The usage of the built-in wire protocol will be removed. You will have to install
`cucumber-wire` and add `require 'cucumber/wire'` in your support code in order
to continue using it, as explained [above](#with-cucumber-710).
