# Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This CHANGELOG follows the format listed [here](https://github.com/sensu-plugins/community/blob/master/HOW_WE_CHANGELOG.md)

## [Unreleased]

## [3.1.2] - 2020-04-03
### Changed
- Removed bare centos build from bonsai definition

## [3.1.1] - 2020-04-03
### Changed
- Fixed travis build

## [3.1.0] - 2020-04-03
### Changed
- Updated rubocop rubocop requirement from ~> 0.51.0 to ~> 0.81.0
- Remediated rubocop warnings
- Updated bundler requirement from ~> 1.7 to ~> 2.1
- Updated rake requirement from ~> 10.0 to ~> 13.0
- Updated codeclimate-test-reporter requirement from ~> 0.4 to ~> 1.0

## [3.0.0] - 2019-09-16
### Breaking Changes
- Bump `sensu-plugin` dependency from `~> 1.2` to `~> 4.0` you can read the changelog entries for [4.0](https://github.com/sensu-plugins/sensu-plugin/blob/master/CHANGELOG.md#400---2018-02-17), [3.0](https://github.com/sensu-plugins/sensu-plugin/blob/master/CHANGELOG.md#300---2018-12-04), and [2.0](https://github.com/sensu-plugins/sensu-plugin/blob/master/CHANGELOG.md#v200---2017-03-29)

### Added
- Travis build automation to generate Sensu Asset tarballs that can be used n conjunction with Sensu provided ruby runtime assets and the Bonsai Asset Index
- Require latest sensu-plugin for [Sensu Go support](https://github.com/sensu-plugins/sensu-plugin#sensu-go-enablement)

## [2.2.3] - 2018-10-01
### Fixed
- `check-nginx-status.rb`: Fixed usage of hostheader without setting url

## [2.2.2] - 2018-03-28
### Security
- updated yard dependency to `~> 0.9.11` per: https://nvd.nist.gov/vuln/detail/CVE-2017-17042 (@majormoses)

## [2.2.1] - 2018-03-17
### Security
- updated rubocop dependency to `~> 0.51.0` per: https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-8418. (@majormoses)

### Fixed
- misc typos (@majormoses)

### Changed
- uipdated Changelog guidelines location (@majormoses)

### Added
- ruby 2.4 testing (@majormoses)

### [2.2.0] - 2017-07-02
## Added
- add jwt token support (@Ishahar)

## [2.1.0] - 2017-02-28
### Added
- add `check-nginx-status` plugin (@hany)

## [2.0.0] - 2016-05-24
### Changed
- remove support for rubies < 2.0
- update to rubocop 0.40 and cleanup

### Added
- ability to specify custom host header values

## [1.0.0] - 2015-12-03
### Added
- metrics-nginx.rb: Added default hostname of 'localhost'
- metrics-nginx.rb: Added usage

### Removed
- Removed nginx-metrics.rb; use metrics-nginx.rb instead

### Changed
- Update to rubocop 0.32.1

## [0.0.6] - 2015-08-04
### Changed
- add gem description

## [0.0.5] - 2015-07-15
- bump version due to wrong file name, no code changes

## [0.0.4] - 2015-07-14 **YANKED**
### Changed
- updated sensu-plugin gem to 1.2.0

## [0.0.3] - 2015-06-10 **YANKED**
### Changed
- changed the name of nginx-metrics.rb to metrics-nginx.rb to conform to std naming
- nginx-metrics.rb is now depericiated and will be removed in a future release
- clean Rakefile
- put gem deps in alpha order in gemspec
- update doc links in README and CONTRIBUTING

### Fixed
- add binstubs for ruby files only

## [0.0.2] - 2015-06-03 **YANKED**
### Fixed
- added binstubs

### Changed
- removed cruft from /lib

## 0.0.1 - 2015-02-11 **YANKED**
- initial stable release

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-nginx/compare/3.1.1...HEAD
[3.1.1]: https://github.com/sensu-plugins/sensu-plugins-nginx/compare/3.1.0...3.1.1
[3.1.0]: https://github.com/sensu-plugins/sensu-plugins-nginx/compare/3.0.0...3.1.0
[3.0.0]: https://github.com/sensu-plugins/sensu-plugins-nginx/compare/2.2.3...3.0.0
[2.2.3]: https://github.com/sensu-plugins/sensu-plugins-nginx/compare/2.2.2...2.2.3
[2.2.2]: https://github.com/sensu-plugins/sensu-plugins-nginx/compare/2.2.1...2.2.2
[2.2.1]: https://github.com/sensu-plugins/sensu-plugins-nginx/compare/2.2.0...2.2.1
[2.2.0]: https://github.com/sensu-plugins/sensu-plugins-nginx/compare/2.1.0...2.2.0
[2.1.0]: https://github.com/sensu-plugins/sensu-plugins-nginx/compare/2.0.0...2.1.0
[2.0.0]: https://github.com/sensu-plugins/sensu-plugins-nginx/compare/1.0.0...2.0.0
[1.0.0]: https://github.com/sensu-plugins/sensu-plugins-nginx/compare/0.0.6...1.0.0
[0.0.6]: https://github.com/sensu-plugins/sensu-plugins-nginx/compare/0.0.5...0.0.6
[0.0.5]: https://github.com/sensu-plugins/sensu-plugins-nginx/compare/0.0.4...0.0.5
[0.0.4]: https://github.com/sensu-plugins/sensu-plugins-nginx/compare/0.0.3...0.0.4
[0.0.3]: https://github.com/sensu-plugins/sensu-plugins-nginx/compare/0.0.2...0.0.3
[0.0.2]: https://github.com/sensu-plugins/sensu-plugins-nginx/compare/0.0.1...0.0.2
