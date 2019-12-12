require "rom/associations/many_to_many"

module ROM
  module JsonApi
    class Associations
      class ManyToMany < ROM::Associations::ManyToMany
        def call(**kwargs)
          binding.pry
        end
      end
    end
  end
end
