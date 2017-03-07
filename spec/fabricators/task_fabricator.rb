Fabricator(:task, from: 'OpenStruct') do
  id { SecureRandom.uuid }
  user_id { SecureRandom.uuid }
  title { ['Drink', Faker::Beer.name].join(' ') }
end
