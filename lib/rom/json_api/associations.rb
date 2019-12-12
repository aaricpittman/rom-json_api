# require 'dry/core/constants'
# require 'dry/core/class_attributes'

# require 'rom/types'
# require 'rom/initializer'
# require 'rom/json_api/association/name'

# module ROM
#   module JsonApi
#     # Abstract association class
#     #
#     # @api public
#     class Association
#       include Dry::Core::Constants
#       include Dry::Equalizer(:source, :target, :result)
#       extend Initializer
#       extend Dry::Core::ClassAttributes

#       defines :result

#       # @!attribute [r] source
#       #   @return [ROM::Relation::Name] the source relation name
#       param :source

#       # @!attribute [r] target
#       #   @return [ROM::Relation::Name] the target relation name
#       param :target

#       # @!attribute [r] relation
#       #   @return [Symbol] an optional relation identifier for the target
#       option :relation, Types::Strict::Symbol, reader: true, optional: true

#       # @!attribute [r] result
#       #   @return [Symbol] either :one or :many
#       option :result, Types::Strict::Symbol, reader: true, default: -> assoc { assoc.class.result }

#       # @!attribute [r] as
#       #   @return [Symbol] an optional association alias name
#       option :as, Types::Strict::Symbol, reader: true, optional: true, default: -> assoc { assoc.target.to_sym }

#       # @!attribute [r] foreign_key
#       #   @return [Symbol] an optional association alias name
#       option :foreign_key, Types::Strict::Symbol, optional: true, reader: true, default: proc { nil }

#       # @!attribute [r] view
#       #   @return [Symbol] An optional view that should be used to extend assoc relation
#       option :view, reader: true, optional: true, default: proc { nil }

#       alias_method :name, :as

#       # @api public
#       def self.new(source, target, options = EMPTY_HASH)
#         super(
#           Name[source],
#           Name[options[:relation] || target, target, options[:as] || target],
#           options
#         )
#       end
#     end
#   end
# end

require 'rom/json_api/associations/one_to_many'
require 'rom/json_api/associations/one_to_one'
require 'rom/json_api/associations/many_to_many'
require 'rom/json_api/associations/many_to_one'
require 'rom/json_api/associations/one_to_one_through'
