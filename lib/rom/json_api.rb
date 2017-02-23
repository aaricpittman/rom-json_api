require 'rom'
require 'rom-http'
require 'rom/json_api/commands'
require 'rom/json_api/dataset'
require 'rom/json_api/gateway'
require 'rom/json_api/plugins'
require 'rom/json_api/relation'
require 'rom/json_api/version'

ROM.register_adapter(:json_api, ROM::JsonApi)
