require 'rom/json_api/handlers'

module ROM
  module JsonApi
    # JSON API Dataset
    #
    # Represents a specific JSON API collection resource
    #
    # @api public
    class Dataset < ROM::HTTP::Dataset
      configure do |config|
        config.default_request_handler = ::ROM::JsonApi::Handlers::Request.new
        config.default_response_handler = ::ROM::JsonApi::Handlers::Response.new
      end
    end
  end
end
