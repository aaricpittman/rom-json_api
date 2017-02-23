require 'json'

module ROM
  module JsonApi
      module Handlers
      class Response
        def call(response, dataset)
          data = JSON.parse(response.body, symbolize_names: true)[:data]

          Array([data]).flatten.map do |record|
            record.merge(record.delete(:attributes))
          end
        end
      end
    end
  end
end
