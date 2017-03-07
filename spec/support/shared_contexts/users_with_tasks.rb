RSpec.shared_context 'users with tasks' do
  include_context 'users'

  let(:task_1) { Fabricate.build(:task, user_id: user_1.id) }
  let(:task_2) { Fabricate.build(:task, user_id: user_1.id) }
  let(:task_3) { Fabricate.build(:task, user_id: user_2.id) }
  let(:tasks) { [task_1, task_2, task_3] }

  before do
    allow(user_1).to receive(:tasks).and_return([task_1, task_2])
    allow(user_2).to receive(:tasks).and_return([task_3])
    allow(user_3).to receive(:tasks).and_return([])
  end
end
