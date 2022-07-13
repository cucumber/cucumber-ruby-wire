# Changelog

All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning](http://semver.org).

This document is formatted according to the principles of [Keep A CHANGELOG](http://keepachangelog.com).

Please visit [cucumber/CONTRIBUTING.md](https://github.com/cucumber/cucumber/blob/master/CONTRIBUTING.md) for more info on how to contribute to Cucumber.

## [Unreleased]

### Changed

### Added

### Fixed

### Removed

## [6.2.1]

### Fixed

- Fix usage with message-related formatters like the html formatter
  ([PR#57](https://github.com/cucumber/cucumber-ruby-wire/pull/57)
   [Issue#56](https://github.com/cucumber/cucumber-ruby-wire/issues/56))

- Removed dependency to cucumber-messages

## [6.2.0]

### Changed

- Patched `cucumber-core`, `cucumber-expressions` and `cucumber-messages`

## [6.1.1]

### Changed

- Use the new `InstallPlugin` hook rather than `AfterConfiguration`.
  ([#52](https://github.com/cucumber/cucumber-ruby-wire/pull/52))

## [6.1.0]
### Added
- The possibility to verify if the plugin has already been installed or not. To
do so, use `Cucumber::Wire::Plugin.installed?`.
([46](https://github.com/cucumber/cucumber-ruby-wire/pull/46))

### Changed
- `cucumber-wire` is now able to install itself as a plugin into `cucumber-ruby`.
([46](https://github.com/cucumber/cucumber-ruby-wire/pull/46))

## [6.0.1]
### Changed
- Patched `cucumber-core` and `cucumber-messages`

## [6.0.0]
### Changed
- Updated `cucumber-core` ~> 10.0.0 and `cucumber-messages` ~> 17.0.0
This brings breaking changes because of internal changes in Cucumber::Messages.
([#44](https://github.com/cucumber/cucumber-ruby-wire/pull/44))

## [5.0.1]
### Changed
- Updated `cucumber-core` ~> 9.0.1

## [5.0.0]
### Changed
- Update from cucumber-expressions 10 to 12 introduces significant underlying changes
in how step definitions are matched. This should be backward compatible but there
is a risk of regressions.
- Updated dependencies (look at the diff for details)

## [4.0.1]
### Changed
- Updated dependencies (look at the diff for details)

## [3.1.0]
### Changed
- `cucumber-core` ~> 7.1.0
- `cucumber-messages` ~> 12.2.0
- Updated gems:

## [3.0.0]
### Changed
- Use `cucumber-ruby-core` 7.0.0
- cucumber-cucumber-expressions ~> 10
- cucumber-messages ~> 12
- Updated monorepo libraries:

## [2.0.1]
### Removed
- Replace use of `MultiJSON` to use native JSON gem

## [2.0.0]
### Changed
- Use `cucumber-ruby-core` 6.0.0

## [1.2.0]
### Added
- Use `Cucumber:Messages::IdGenerator::UUID` to provide ids for `Hooks`

### Removed
- Multiline arguments do not need `Location` anymore

## [1.1.0]
### Changed
- Update to cucumber-expressions 8.0.2
- Update to cucumber 4.0.0

## [1.0.0]
### Added
- Added this CHANGELOG.md file per [cucumber/cucumber #251](https://github.com/cucumber/cucumber/issues/251) ([#13](https://github.com/cucumber/cucumber-ruby-wire/pull/13) [jaysonesmith](https://github.com/jaysonesmith))

### Changed
- Changes to work with a modern Cucumber-Ruby ([#14](https://github.com/cucumber/cucumber-ruby-wire/pull/14) [brasmusson](https://github.com/brasmusson))
- Adapt to the move of Location to Cucumber::Core::Test ([#14](https://github.com/cucumber/cucumber-ruby-wire/pull/14) [brasmusson](https://github.com/brasmusson))

[Unreleased]: https://github.com/cucumber/cucumber-ruby-wire/compare/v6.2.1...main
[6.2.1]: https://github.com/cucumber/cucumber-ruby-wire/compare/v6.2.0...v6.2.1
[6.2.0]: https://github.com/cucumber/cucumber-ruby-wire/compare/v6.1.1...v6.2.0
[6.1.1]: https://github.com/cucumber/cucumber-ruby-wire/compare/v6.1.0...v6.1.1
[6.1.0]: https://github.com/cucumber/cucumber-ruby-wire/compare/v6.0.1...v6.1.0
[6.0.1]: https://github.com/cucumber/cucumber-ruby-wire/compare/v6.0.0...v6.0.1
[6.0.0]: https://github.com/cucumber/cucumber-ruby-wire/compare/v5.0.1...v6.0.0
[5.0.1]: https://github.com/cucumber/cucumber-ruby-wire/compare/v5.0.0...v5.0.1
[5.0.0]: https://github.com/cucumber/cucumber-ruby-wire/compare/v4.0.1...v5.0.0
[4.0.1]: https://github.com/cucumber/cucumber-ruby-wire/compare/v4.0.0...v4.0.1
[3.1.0]: https://github.com/cucumber/cucumber-ruby-wire/compare/v3.0.0...v3.1.0
[3.0.0]: https://github.com/cucumber/cucumber-ruby-wire/compare/v2.0.1...v3.0.0
[2.0.1]: https://github.com/cucumber/cucumber-ruby-wire/compare/v2.0.0...v2.0.1
[2.0.0]: https://github.com/cucumber/cucumber-ruby-wire/compare/v1.2.0...v2.0.0
[1.2.0]: https://github.com/cucumber/cucumber-ruby-wire/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/cucumber/cucumber-ruby-wire/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/cucumber/cucumber-ruby-wire/compare/v0.0.1...v1.0.0
ire/compare/v6.1.0...main
[6.1.0]: https://github.com/cucumber/cucumber-ruby-wire/compare/v6.0.1...v6.1.0
[6.0.1]: https://github.com/cucumber/cucumber-ruby-wire/compare/v6.0.0...v6.0.1