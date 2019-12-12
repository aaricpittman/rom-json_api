require "rom/associations/many_to_one"

module ROM
  module JsonApi
    class Associations
      class ManyToOne < ROM::Associations::ManyToOne
        def call(**kwargs)
          binding.pry
        end
      end
    end
  end
end
