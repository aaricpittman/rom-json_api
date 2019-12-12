require "rom/associations/one_to_many"

module ROM
  module JsonApi
    class Associations
      class OneToMany < ROM::Associations::OneToMany
        def call(target: self.target)
          target
        end
      end
    end
  end
end
