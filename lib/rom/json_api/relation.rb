module ROM
  module JsonApi
    # JSON API Dataset
    #
    # Represents a specific JSON API collection resource
    #
    # @api public
    class Relation < ROM::HTTP::Relation
      adapter :json_api
    end
  end
end
