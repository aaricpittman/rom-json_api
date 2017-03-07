RSpec.describe 'ROM::JsonApi::Relation', method: '#to_a' do
  include_context 'container'
  include_context 'users response'

  let(:url) do
    "#{base_url}/users"
  end

  before do
    stub_request(:get, url).to_return(status: 200, body: response)
  end

  subject!(:result) { users_relation.to_a }

  it do
    expect(result[0]).to eq(
      id: user_1.id,
      name: user_1.name,
      email: user_1.email
    )
    expect(result[1]).to eq(
      id: user_2.id,
      name: user_2.name,
      email: user_2.email
    )
    expect(result[2]).to eq(
      id: user_3.id,
      name: user_3.name,
      email: user_3.email
    )
  end
end
