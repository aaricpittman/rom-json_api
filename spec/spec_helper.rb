require 'rom-json_api'

begin
  require 'byebug'
rescue LoadError
end

SPEC_ROOT = root = Pathname(__FILE__).dirname

require 'webmock/rspec'
require 'faker'
require 'fabrication'

Dir[root.join('support/**/*.rb')].each do |f|
  require f
end

RSpec.configure do |config|
  config.before :suite do
    WebMock.disable_net_connect!
  end

  config.disable_monkey_patching!
end
