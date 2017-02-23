module ROM
  module JsonApi
    module Plugin
      # @api private
      module Filters
        # @api private
        def self.included(klass)
          super
          klass.class_eval do
            include(InstanceInterface)
          end
        end

        # @api private
        module InstanceInterface
          def filter(**filters)
            add_params(process_filters(filters))
          end

          private

          def process_filters(filters)
            filters.each_with_object({}) do |(name, value), hash|
              hash["filter[#{name}]"] = value
            end
          end
        end
      end
    end
  end
end
