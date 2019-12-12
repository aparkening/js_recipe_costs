Fabricator(:user) do
  recipes(count: 3)
  # user_ingredient_costs(count: 10)  
  name { Faker::Name.name}
  email { Faker::Internet.email }
  password { Faker::Superhero.name }
  organization { Faker::Team.name }
end