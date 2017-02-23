module ROM
  module JsonApi
    module Plugin
      # @api private
      module Sorting
        # @api private
        def self.included(klass)
          super
          klass.class_eval do
            include(InstanceInterface)
          end
        end

        # @api private
        module InstanceInterface
          def sort(*attributes)
            add_params(
              sort: (dataset.params[:sort] + attributes).flatten.join(',')
            )
          end
        end
      end
    end
  end
end
