# ROM::JsonApi

JSON API adapter for [Ruby Object Mapper](http://rom-rb.org).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rom-json_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rom-json_api

## Usage

```ruby
class Users < ROM::Relation[:json_api]
  use :filters
  use :includes
  use :pagination
  use :sorting

  schema(:events) do
    attribute :id, ROM::Types::String
    attribute :name, ROM::Types::String
    attribute :email, ROM::Types::String
  end
end

configuration = ROM::Configuration.new(:json_api, {
  uri: 'http://localhost:8080/api',
  headers: {
    Accept: 'application/json'
  }
})
configuration.register_relation(Users)
container = ROM.container(configuration)

container.relation(:users).filter(name: 'Jane').per_page(5).to_a
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rom-rb/rom-json_api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

