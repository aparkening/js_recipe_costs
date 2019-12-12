Fabricator(:recipe_ingredient) do
  ingredient
  ingredient_amount { Faker::Number.number(digits: 2) }
  ingredient_unit { Faker::Food.metric_measurement }
end

