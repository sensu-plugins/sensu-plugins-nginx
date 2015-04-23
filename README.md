## Sensu-Plugins-nginx

[![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-nginx.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-nginx)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-nginx.svg)](http://badge.fury.io/rb/sensu-plugins-nginx)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-nginx/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-nginx)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-nginx/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-nginx)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-nginx.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-nginx)
[ ![Codeship Status for sensu-plugins/sensu-plugins-nginx](https://codeship.com/projects/cb4b6810-cb1c-0132-b746-0ab4e5d2e01d/status?branch=master)](https://codeship.com/projects/75658)

## Functionality

**nginx-metrics**

Fetch the nginx status page and convert the response into graphite metrics

## Files
 * bin/nginx-metrics.rb
Get the nginx metrics from the status page url for use with Graphite

## Usage

## Installation

Add the public key (if you haven’t already) as a trusted certificate

```
gem cert --add <(curl -Ls https://raw.githubusercontent.com/sensu-plugins/sensu-plugins.github.io/master/certs/sensu-plugins.pem)
gem install sensu-plugins-nginx -P MediumSecurity
```

You can also download the key from /certs/ within each repository.

#### Rubygems

`gem install sensu-plugins-nginx`

#### Bundler

Add *sensu-plugins-nginx* to your Gemfile and run `bundle install` or `bundle update`

#### Chef

Using the Sensu **sensu_gem** LWRP
```
sensu_gem 'sensu-plugins-nginx' do
  options('--prerelease')
  version '0.0.1.alpha.1'
end
```

Using the Chef **gem_package** resource
```
gem_package 'sensu-plugins-nginx' do
  options('--prerelease')
  version '0.0.1.alpha.1'
end
```

## Notes
