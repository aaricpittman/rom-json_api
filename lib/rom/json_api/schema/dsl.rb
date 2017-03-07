require 'rom/json_api/schema/associations_dsl'

module ROM
  module JsonApi
    class Schema < ROM::Schema
      # Extended schema DSL
      #
      # @api private
      class DSL < ROM::Schema::DSL
        attr_reader :associations_dsl

        # Define associations for a relation
        #
        # @example
        #   class Users < ROM::Relation[:json_api]
        #     schema do
        #       attribute :id, ROM::Types::String.meta(primary_key: true)
        #       attribute :name, ROM::Types::String
        #       attribute :email, ROM::Types::String
        #
        #       associations do
        #         has_many :tasks
        #       end
        #     end
        #   end
        #
        #   class Tasks < ROM::Relation[:json_api]
        #     schema do
        #       attribute :id, ROM::Types::String.meta(primary_key: true)
        #       attribute :user_id, ROM::Types::Int.meta(
        #         foreign_key: true,
        #         target: :users
        #       )
        #       attribute :title, ROM::Types::String
        #
        #       associations do
        #         belongs_to :users
        #       end
        #     end
        #   end
        #
        # @return [AssociationDSL]
        #
        # @api public
        def associations(&block)
          @associations_dsl = AssociationsDSL.new(relation, &block)
        end

        # Return a schema
        #
        # @api private
        def call
          JsonApi::Schema.define(relation, opts.merge(attributes: attributes.values))
        end

        private

        # Return schema opts
        #
        # @return [Hash]
        #
        # @api private
        def opts
          opts = { inferrer: inferrer }

          if associations_dsl
            { **opts, associations: associations_dsl.call }
          else
            opts
          end
        end
      end
    end
  end
end
