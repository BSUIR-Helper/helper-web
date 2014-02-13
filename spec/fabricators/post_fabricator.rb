Fabricator :post do
  title { Faker::Lorem.sentence }
  description { Faker::Lorem.paragraph }
  discipline { Fabricate(:discipline) }
  author { Fabricate(:user) }
end
