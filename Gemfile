source 'https://rubygems.org'

gemspec

gem 'rom-http', github: 'rom-rb/rom-http'

group :test do
  gem 'rom', git: 'https://github.com/rom-rb/rom', branch: 'master' do
    gem 'rom-core'
    gem 'rom-repository', group: :tools
  end

  gem 'webmock'
  gem 'fabrication'
  gem 'faker'
end
