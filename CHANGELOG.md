#Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This CHANGELOG follows the format listed at [Keep A Changelog](http://keepachangelog.com/)

## Unreleased

[1.0.0] - 2015-12-03
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

## [0.0.1] - 2015-02-11 **YANKED**
- initial stable release
