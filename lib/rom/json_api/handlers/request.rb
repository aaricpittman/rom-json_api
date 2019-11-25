require 'net/http'

module ROM
  module JsonApi
    module Handlers
      class Request
        def call(dataset)
          uri = dataset.uri

          http = Net::HTTP.new(uri.host, uri.port)
          request_klass = Net::HTTP.const_get(Inflector.classify(dataset.request_method))

          request = request_klass.new(uri.request_uri)
          dataset.headers.each_with_object(request) do |(header, value), request|
            request[header.to_s] = value
          end

          response = http.request(request)
        end
      end
    end
  end
end
