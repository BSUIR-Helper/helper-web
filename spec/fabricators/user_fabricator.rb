Fabricator :user do
  email 'test@example.com'
  password 'password'
  password_confirmation 'password'
end

Fabricator :admin, :from => :user do
  admin true
end
