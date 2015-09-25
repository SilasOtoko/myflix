Fabricator(:video) do
  title { Faker::Lorem.words(5).join(" ") }
  description { Faker::Lorem.paragraph(2) }
  category_id { 2 }
end