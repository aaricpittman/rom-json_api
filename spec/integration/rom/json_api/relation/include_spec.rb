RSpec.describe 'ROM::JsonApi::Relation', method: '#include' do
  include_context 'container'
  include_context 'users with tasks response'

  let(:url) do
    "#{base_url}/users?include=tasks"
  end

  before do
    stub_request(:get, url).to_return(status: 200, body: response)
  end

  subject!(:result) { users_relation.combine(:tasks).to_a }

  it "", :focus do
    binding.pry
    expect(result[0]).to eq(
      id: user_1.id,
      name: user_1.name,
      email: user_1.email,
      tasks: [
        {
          id: task_1.id,
          user_id: task_1.user_id,
          title: task_1.title
        },
        {
          id: task_2.id,
          user_id: task_2.user_id,
          title: task_2.title
        }
      ]
    )
    expect(result[1]).to eq(
      id: user_2.id,
      name: user_2.name,
      email: user_2.email,
      tasks: [
        {
          id: task_3.id,
          user_id: task_3.user_id,
          title: task_3.title
        }
      ]
    )
    expect(result[2]).to eq(
      id: user_3.id,
      name: user_3.name,
      email: user_3.email,
      tasks: []
    )
  end
end
