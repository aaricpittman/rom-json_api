RSpec.shared_context 'users response' do
  include_context 'users'

  let(:response) do
    JSON.dump(
      'links' => {
        'next' => nil,
        'last' => url
      },
      'data' => users.map { |user|
        {
          'type' => 'users',
          'id' => user.id,
          'attributes' => {
            'name' => user.name,
            'email' => user.email
          },
          'relationships' => {
            'tasks' => {
              'links' => {
                'self' => "/users/#{user.id}/relationships/tasks",
                'related' => "/users/#{user.id}/tasks"
              }
            }
          }
        }
      },
      'meta' => {
        'author' => 'rom-rb.org',
        'license' => 'wtfpl',
        'license-url' => 'http://www.wtfpl.net'
      }
    )
  end
end
