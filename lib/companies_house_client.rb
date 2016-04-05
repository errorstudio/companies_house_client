require 'require_all'
require 'her'
require_rel "."


module CompaniesHouseClient
  API_URL = "https://api.companieshouse.gov.uk"
  DOCUMENT_URL = "https://beta.companieshouse.gov.uk"

  class << self

    #access the configuration class
    attr_accessor :configuration

    #block for configuration.
    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
      self.configuration.configure_connection
    end
  end

  class Configuration
    attr_accessor :api_key, :url, :ssl_options, :proxy
    attr_reader :connection

    def initialize
      @connection ||= Her::API.new
      @api_key = ""
      @url = CompaniesHouseClient::API_URL
      @ssl_options = {
        ca_path: CompaniesHouseClient::CAPath.platform_path
      }
      @proxy
    end

    def configure_connection

      @connection.setup url: @url, ssl: @ssl_options, proxy: @proxy do |c|

        #Auth
        c.use Faraday::Request::BasicAuthentication, @api_key, ''

        # Request
        c.use Faraday::Request::UrlEncoded

        # Parse collections
        c.use CompaniesHouseClient::CollectionParser
        # c.use Her::Middleware::DefaultParseJSON

        # Adapter
        c.use Faraday::Adapter::NetHttp
      end
    end
  end
end
