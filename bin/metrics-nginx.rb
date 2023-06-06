#! /usr/bin/env ruby
# frozen_string_literal: true

#
#   nginx-metrics
#
# DESCRIPTION:
#   Pull nginx metrics for backends through stub status module
#
# OUTPUT:
#   metric data
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sensu-plugin
#
# USAGE:
#   metrics-nginx.rb -h hostname -p port -q status_path
#   metrics-nginx.rb -u http://hostname:port/status_path
#
# NOTES:
#
# LICENSE:
#   Copyright 2012 Pete Shima <me@peteshima.com>
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/metric/cli'
require 'net/https'
require 'uri'
require 'socket'

#
# Nginx Metrics
#
class NginxMetrics < Sensu::Plugin::Metric::CLI::Graphite
  option :url,
         short: '-u URL',
         long: '--url URL',
         description: 'Full URL to nginx status page, example: https://yoursite.com/nginx_status This ignores ALL other options EXCEPT --scheme'

  option :hostname,
         short: '-h HOSTNAME',
         long: '--host HOSTNAME',
         description: 'Nginx hostname',
         default: 'localhost'

  option :port,
         short: '-p PORT',
         long: '--port PORT',
         description: 'Nginx  port',
         default: '80'

  option :path,
         short: '-q STATUSPATH',
         long: '--statspath STATUSPATH',
         description: 'Path to your stub status module',
         default: 'nginx_status'

  option :hostheader,
         long: '--hostheader HOSTHEADER',
         description: 'Set the Host header to this string'
  option :token,
         long: '--token token',
         description: 'JWT Token'

  option :scheme,
         description: 'Metric naming scheme, text to prepend to metric',
         short: '-s SCHEME',
         long: '--scheme SCHEME',
         default: "#{Socket.gethostname}.nginx"

  # Main function
  #
  def run
    found = false
    attempts = 0
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
        if config[:token]
          request['Authorization'] = "Bearer #{config[:token]}"
        end
        response = http.request(request)
      else
        response = Net::HTTP.start(config[:hostname], config[:port]) do |connection|
          request = Net::HTTP::Get.new("/#{config[:path]}")
          connection.request(request)
        end
      end
      if response.code == '200'
        found = true
      elsif !response.header['location'].nil?
        config[:url] = response.header['location']
      end
    end

    # #YELLOW
    response.body.split(/\r?\n/).each do |line|
      if line =~ /^Active connections:\s+(\d+)/
        connections = line.match(/^Active connections:\s+(\d+)/).to_a
        output "#{config[:scheme]}.active_connections", connections[1]
      end
      if line =~ /^\s+(\d+)\s+(\d+)\s+(\d+)/
        requests = line.match(/^\s+(\d+)\s+(\d+)\s+(\d+)/).to_a
        output "#{config[:scheme]}.accepts", requests[1]
        output "#{config[:scheme]}.handled", requests[2]
        output "#{config[:scheme]}.requests", requests[3]
      end
      if line =~ /^Reading:\s+(\d+).*Writing:\s+(\d+).*Waiting:\s+(\d+)/
        queue = line.match(/^Reading:\s+(\d+).*Writing:\s+(\d+).*Waiting:\s+(\d+)/).to_a
        output "#{config[:scheme]}.reading", queue[1]
        output "#{config[:scheme]}.writing", queue[2]
        output "#{config[:scheme]}.waiting", queue[3]
      end
    end
    ok
  end
end
