Fabricator :user do
  email { Faker::Internet.email }
  password 'password'
  password_confirmation 'password'
end

Fabricator :admin, :from => :user do
  admin true
end
