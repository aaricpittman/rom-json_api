module ROM
  module JsonApi
    module Plugin
      # @api private
      module Pagination
        # @api private
        def self.included(klass)
          super
          klass.class_eval do
            include(InstanceInterface)
          end
        end

        # @api private
        module InstanceInterface
          def page(page)
            add_params('page[number]' => page)
          end

          def per_page(per_page)
            add_params('page[size]' => per_page)
          end
        end
      end
    end
  end
end
