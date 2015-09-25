Fabricator(:user) do
  email { Faker::Internet.email }
  password_digest 'password'
  username { Faker::Name.name }
end