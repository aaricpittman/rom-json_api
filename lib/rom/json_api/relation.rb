require 'rom/json_api/schema'
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
      schema_class ::ROM::JsonApi::Schema
      schema_dsl ::ROM::JsonApi::Schema::DSL

      def combine(*combines)
        super

        dataset.add_params(
          include: (dataset.params[:include].to_a + combines).flatten.join(',')
        )
      end

      def to_enum
        binding.pry

        super

      end
    end
  end
end
