RSpec.shared_context 'container' do
  let(:base_url) { 'http://json-api.com' }
  let(:configuration) { ROM::Configuration.new(:json_api, uri: base_url) }
  let(:container) { ROM.container(configuration) }
  let(:users_relation_class) do
    Class.new(ROM::JsonApi::Relation) do
      use :filters
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
    Class.new(ROM::JsonApi::Relation) do
      schema(:tasks) do
        attribute :id, ROM::Types::String.meta(primary_key: true)
        attribute :user_id, ROM::Types::Integer.meta(foreign_key: true, target: :users)
        attribute :title, ROM::Types::String

        associations do
          belongs_to :user
        end
      end
    end
  end
  
  let(:users_relation) { container.relations[:users] }
  let(:tasks_relation) { container.relations[:tasks] }

  before do
    configuration.register_relation(users_relation_class)
    configuration.register_relation(tasks_relation_class)
  end
end
