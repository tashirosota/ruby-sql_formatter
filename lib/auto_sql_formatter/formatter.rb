require 'uri'
require 'net/http'
require 'json'

module AutoSqlFormatter
  class Formatter
    DEFAULT_INDENT = 2
    DEFAULT_CASE = 'upper'.freeze
    API_URI = 'https://sqlformat.org/api/v1/format'.freeze
    HEADERS = { 'Content-Type' => 'application/x-www-form-urlencoded' }.freeze

    class << self
      def do(sqls)
        Array(sqls).map { |sql| { from: sql, to: format(sql) } }
      end

      def format(sql)
        uri = URI(API_URI)
        https = Net::HTTP.new(uri.host, uri.port)
        https.use_ssl = true

        body = URI.encode_www_form(sql: sql, keyword_case: DEFAULT_CASE)

        '===Net::HTTP==='
        response = https.post(uri.path, body, HEADERS)
        JSON.parse(response.body)['result']
      end
    end
    class Error < StandardError; end
  end
end
