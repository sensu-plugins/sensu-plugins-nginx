#! /usr/bin/env ruby
#
#   check-nginx-status
#
# DESCRIPTION:
# Sensu Check that fetches Nginx Status
#
# OUTPUT:
#   plain text
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sensu-plugin
#
# USAGE:
# You need to enable nginx status
# https://easyengine.io/tutorials/nginx/status-page/
# check-nginx-status.rb --help
#
# NOTES:
#
# LICENSE:
# Adapted from official metrics-nginx plugin (Pete Shima <me@peteshima.com>)
# Magic Online http://www.magic.fr  @2016 - hanynowsky@gmail.com
# Released under the same terms as Sensu (the MIT license); see LICENSE  for details.
# Last Modified October 2016
#

require 'net/https'
require 'uri'
require 'socket'
require 'sensu-plugin/check/cli'

#
# Nginx Status Check
#
class CheckNginxStatus < Sensu::Plugin::Check::CLI
  option :url,
         short: '-u URL',
         long: '--url URL',
         description: 'Full URL to nginx status page, example: https://yoursite.com/nginx_status This ignores ALL other options'

  option :hostname,
         short: '-h HOSTNAME',
         long: '--host HOSTNAME', description: 'Nginx hostname', default: 'localhost'

  option :port,
         short: '-p PORT',
         long: '--port PORT',
         description: 'Nginx  port',
         default: '80'

  option :activecon,
         short: '-a ACTIVE_CONNECTION_THRESHOLD',
         long: '--activecon ACTIVE_CONNECTION_THRESHOLD',
         description: 'Active connections threshold',
         default: 300

  option :waitingreq,
         short: '-w WAITING_REQUESTS_THRESHOLD',
         long: '--waitingreq WAITING_REQUESTS_THRESHOLD',
         description: 'Waiting requests threshold',
         default: 30

  option :path,
         short: '-q STATUSPATH',
         long: '--statspath STATUSPATH',
         description: 'Path to your stub status module',
         default: 'nginx_status'

  option :hostheader,
         long: '--hostheader HOSTHEADER',
         description: 'Set the Host header to this string'

  #
  # Acquire Nginx Status
  #
  def statutor
    found = false
    attempts = 0
    begin
      until found || attempts >= 10
        attempts += 1
        if config[:url]
          uri = URI.parse(config[:url])
          http = Net::HTTP.new(uri.host, uri.port)
          if uri.scheme == 'https'
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
          end
          request = Net::HTTP::Get.new(uri.request_uri)
          if config[:hostheader]
            request['Host'] = config[:hostheader]
          end
          response = http.request(request)
          if response.code == '200'
            found = true
          elsif !response.header['location'].nil?
            config[:url] = response.header['location']
          end
        else
          response = Net::HTTP.start(config[:hostname], config[:port]) do |connection|
            request = Net::HTTP::Get.new("/#{config[:path]}")
            connection.request(request)
          end
        end
        return response
      end
    rescue StandardError => e
      unknown "Could not fetch Nginx status | #{e.message}"
    end
  end

  #
  # Main function
  #
  def run
    code = statutor
    #### Metrics
    code.body.split(/\r?\n/).each do |line|
      if line =~ /^Active connections:\s+(\d+)/
        connections = line.match(/^Active connections:\s+(\d+)/).to_a
        if connections[1].to_i > config[:activecon].to_i
          warning "Active connections: #{connections[1]}"
        end
      end
      if line =~ /^Reading:\s+(\d+).*Writing:\s+(\d+).*Waiting:\s+(\d+)/
        queue = line.match(/^Reading:\s+(\d+).*Writing:\s+(\d+).*Waiting:\s+(\d+)/).to_a
        warning "Waiting requests: #{queue[3]}" if queue[3].to_i > config[:waitingreq].to_i
      end
    end
    #####
    ok 'Nginx is Alive and healthy' if code.code.to_i == 200
    warning 'Nginx Status endpoint is mis-configured' if code.code.to_i == 301
    critical 'Nginx is Down'
  end
end
