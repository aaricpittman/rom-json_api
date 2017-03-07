module ROM
  module JsonApi
    class Association
      class OneToMany < Association
        result :many

        # @api public
        def call(relations, right = relations[target.relation])
          # TODO
        end
      end
    end
  end
end
