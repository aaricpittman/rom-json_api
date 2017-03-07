RSpec.shared_context 'container' do
  let(:base_url) { 'http://json-api.com' }
  let(:configuration) { ROM::Configuration.new(:json_api, uri: base_url) }
  let(:users_relation_class) do
    Class.new(ROM::Relation[:json_api]) do
      use :filters
      use :includes
      use :pagination
      use :sorting

      schema(:users) do
        attribute :id, ROM::Types::String.meta(primary_key: true)
        attribute :name, ROM::Types::String
        attribute :email, ROM::Types::String

        associations do
          has_many :tasks
        end
      end
    end
  end
  let(:tasks_relation_class) do
    Class.new(ROM::Relation[:json_api]) do
      schema(:tasks) do
        attribute :id, ROM::Types::String.meta(primary_key: true)
        attribute :user_id, ROM::Types::Int.meta(foreign_key: true, target: :users)
        attribute :title, ROM::Types::String

        associations do
          belongs_to :user
        end
      end
    end
  end
  let(:configuration) do
    configuration = ROM::Configuration.new(:json_api, uri: base_url)
    configuration.register_relation(users_relation_class)
    configuration.register_relation(tasks_relation_class)
    configuration
  end
  let(:container) { ROM.container(configuration) }
  let(:users_relation) { container.relation(:users) }
  let(:tasks_relation) { container.relation(:tasks) }
end
