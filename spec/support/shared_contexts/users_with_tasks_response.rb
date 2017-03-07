RSpec.shared_context 'users with tasks response' do
  include_context 'users with tasks'

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
              },
              'data' => user.tasks.map { |task|
                {
                  'type' => 'tasks',
                  'id' => task.id
                }
              }
            }
          }
        }
      },
      'included' => tasks.map { |task|
        {
          'type' => 'tasks',
          'id' => task.id,
          'attributes' => {
            'user_id' => task.user_id,
            'title' => task.title
          },
          'relationships' => {
            'user' => {
              'links' => {
                'self' => "/tasks/#{task.id}/relationships/user",
                'related' => "/tasks/#{task.id}/user"
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
