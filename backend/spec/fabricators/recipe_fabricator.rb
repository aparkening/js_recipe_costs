Fabricator(:recipe) do
  name { Faker::Food.dish }
  servings 8
  recipe_ingredients(count: 12)
end