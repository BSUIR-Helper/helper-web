Fabricator :discipline do
  name { Faker::Lorem.words.join(' ').titleize }
  abbr { Faker::Lorem.word.upcase }
end
