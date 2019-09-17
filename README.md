## Sensu-Plugins-nginx

[![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-nginx.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-nginx)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-nginx.svg)](http://badge.fury.io/rb/sensu-plugins-nginx)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-nginx/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-nginx)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-nginx/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-nginx)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-nginx.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-nginx)
[![Sensu Bonsai Asset](https://img.shields.io/badge/Bonsai-Download%20Me-brightgreen.svg?colorB=89C967&logo=sensu)](https://bonsai.sensu.io/assets/sensu-plugins/sensu-plugins-nginx)

## Sensu Asset
The Sensu assets packaged from this repository are built against the Sensu Ruby runtime environment. When using these assets as part of a Sensu Go resource (check, mutator or handler), make sure you include the corresponding Sensu Ruby runtime asset in the list of assets needed by the resource. The current ruby-runtime assets can be found [here](https://bonsai.sensu.io/assets/sensu/sensu-ruby-runtime) in the [Bonsai Asset Index](bonsai.sensu.io).

## Functionality

**metrics-nginx**

Fetch the nginx status page and convert the response into metrics

**check-nginx-status**

Check nginx statistics

## Files
 * bin/metrics-nginx.rb
 * bin/check-nginx-status.rb

## Usage

## Installation

[Installation and Setup](http://sensu-plugins.io/docs/installation_instructions.html)

## Notes
