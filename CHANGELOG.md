# Changelog

All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning](http://semver.org).

This document is formatted according to the principles of [Keep A CHANGELOG](http://keepachangelog.com).

Please visit [cucumber/CONTRIBUTING.md](https://github.com/cucumber/cucumber/blob/master/CONTRIBUTING.md) for more info on how to contribute to Cucumber.

## [Unreleased]
### Added
- Added some basic rubocop compliance to suite (More fixes to come) ([#69](https://github.com/cucumber/cucumber-ruby-wire/pull/69) [#70](https://github.com/cucumber/cucumber-ruby-wire/pull/70))

### Changed
- Minimum ruby version is now 3.1 ([#82](https://github.com/cucumber/cucumber-ruby-wire/pull/82))
- Enabled latest versions of `cucumber-core` and `cucumber-expressions` ([#82](https://github.com/cucumber/cucumber-ruby-wire/pull/82))

### Fixed

## [7.0.0] - 2023-11-10
### Changed
- Minimum ruby version is now 2.6 ([#68](https://github.com/cucumber/cucumber-ruby-wire/pull/68))
- Compatibility with cucumber versions up to cucumber 9.x now added ([#68](https://github.com/cucumber/cucumber-ruby-wire/pull/68))

### Fixed
- Fixed up some basic style incompatibilities with old rspec tests ([#68](https://github.com/cucumber/cucumber-ruby-wire/pull/68))

## [6.2.1] - 2022-01-07
### Fixed
- Fix usage with message-related formatters like `html-formatter` ([#57](https://github.com/cucumber/cucumber-ruby-wire/pull/57))
- Removed dependency to `cucumber-messages`

## [6.2.0] - 2021-10-12
### Changed
- Patched `cucumber-core`, `cucumber-expressions` and `cucumber-messages`

## [6.1.1] - 2021-08-27
### Changed
- Use the new `InstallPlugin` hook rather than `AfterConfiguration`.
([#52](https://github.com/cucumber/cucumber-ruby-wire/pull/52))

## [6.1.0] - 2021-08-09
### Added
- The possibility to verify if the plugin has already been installed or not. To
do so, use `Cucumber::Wire::Plugin.installed?`.
([46](https://github.com/cucumber/cucumber-ruby-wire/pull/46))

### Changed
- `cucumber-wire` is now able to install itself as a plugin into `cucumber-ruby`.
([46](https://github.com/cucumber/cucumber-ruby-wire/pull/46))

## [6.0.1] - 2021-07-19
### Changed
- Patched `cucumber-core` and `cucumber-messages`

## [6.0.0] - 2021-07-09
### Changed
- Updated `cucumber-core` ~> 10.0.0 and `cucumber-messages` ~> 17.0.0
This brings breaking changes because of internal changes in Cucumber::Messages.
([#44](https://github.com/cucumber/cucumber-ruby-wire/pull/44))

[Unreleased]: https://github.com/cucumber/cucumber-ruby-wire/compare/v7.0.0...HEAD
[7.0.0]: https://github.com/cucumber/cucumber-ruby-wire/compare/v6.2.1...v7.0.0
[6.2.1]: https://github.com/cucumber/cucumber-ruby-wire/compare/v6.2.0...v6.2.1
[6.2.0]: https://github.com/cucumber/cucumber-ruby-wire/compare/v6.1.1...v6.2.0
[6.1.1]: https://github.com/cucumber/cucumber-ruby-wire/compare/v6.1.0...v6.1.1
[6.1.0]: https://github.com/cucumber/cucumber-ruby-wire/compare/v6.0.1...v6.1.0
[6.0.1]: https://github.com/cucumber/cucumber-ruby-wire/compare/v6.0.0...v6.0.1
[6.0.0]: https://github.com/cucumber/cucumber-ruby-wire/compare/v5.0.1...v6.0.0
