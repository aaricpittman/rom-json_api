require 'rom/types'

module ROM
  module JsonApi
    class Association
      class ManyToMany < Association
        result :many

        option :through, type: Types::Strict::Symbol.optional

        # @api private
        def initialize(*)
          super
          @through = Relation::Name[
            options[:through] || options[:through_relation], options[:through]
          ]
        end

        # @api public
        def call(relations, target_rel = nil)
          # TODO
        end
      end
    end
  end
end
