module ROM
  module JsonApi
    class Association
      class ManyToOne < Association
        result :one

        # @api public
        def call(relations, left = relations[target.relation])
          # TODO
        end
      end
    end
  end
end
