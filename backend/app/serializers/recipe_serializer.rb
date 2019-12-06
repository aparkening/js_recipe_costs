class RecipeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :servings, :updated_at
  belongs_to :user
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
end
