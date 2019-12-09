class UserIngredientCostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :cost, :cost_size, :cost_unit, :updated_at
  belongs_to :user
  belongs_to :ingredient
end
