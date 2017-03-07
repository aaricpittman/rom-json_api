require 'rom/json_api/schema/dsl'

module ROM
  module JsonApi
    # JSON API Dataset
    #
    # Represents a specific JSON API collection resource
    #
    # @api public
    class Relation < ROM::HTTP::Relation
      adapter :json_api
      schema_dsl ::ROM::JsonApi::Schema::DSL
    end
  end
end
