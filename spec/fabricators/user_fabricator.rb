Fabricator(:user, from: 'OpenStruct') do
  id { SecureRandom.uuid }
  name { Faker::Name.name }
  email { Faker::Internet.email }
end
