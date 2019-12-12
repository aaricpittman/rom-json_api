module ROM
  module JsonApi
    class Associations
      class OneToOneThrough < ManyToMany
        def call(**kwargs)
          binding.pry
        end
      end
    end
  end
end
