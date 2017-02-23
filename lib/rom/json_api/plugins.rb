require 'rom/json_api/plugin/filters'
require 'rom/json_api/plugin/includes'
require 'rom/json_api/plugin/pagination'
require 'rom/json_api/plugin/sorting'

ROM.plugins do
  adapter :json_api do
    register :filters, ROM::JsonApi::Plugin::Filters, type: :relation
    register :includes, ROM::JsonApi::Plugin::Includes, type: :relation
    register :pagination, ROM::JsonApi::Plugin::Pagination, type: :relation
    register :sorting, ROM::JsonApi::Plugin::Sorting, type: :relation
  end
end
