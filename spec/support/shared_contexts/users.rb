RSpec.shared_context 'users' do
  let(:user_1) { Fabricate.build(:user) }
  let(:user_2) { Fabricate.build(:user) }
  let(:user_3) { Fabricate.build(:user) }
  let(:users) { [user_1, user_2, user_3] }
end
