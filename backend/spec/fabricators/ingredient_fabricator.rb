Fabricator(:ingredient) do
  name { Faker::Food.ingredient }
  cost { Faker::Number.decimal(l_digits: 2) }
  cost_size { Faker::Number.number(digits: 2) }
  cost_unit { Faker::Food.metric_measurement }
end