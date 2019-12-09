class Api::V1::UserIngredientCostsController < ApplicationController
  # before_action :require_login

  # All records
  def index
    # redirect_to ingredients_path if is_admin?
    # redirect_non_users

    user = User.find_by(id: params[:user_id])
    user_ingredient_costs = user.user_ingredient_costs.order(name: :asc)
    # ingredients = Ingredient.all.order(name: :asc)

    options = {
      include: [:ingredients]
    }
    render json: UserIngredientCostSerializer.new(user_ingredient_costs, options).serialized_json
  end

  # Display record
  def show
    # redirect_to ingredients_path if is_admin?
    # redirect_non_users
    
    user = User.find_by(id: params[:user_id])
    # Require authorization
    # require_authorization(@user)

    user_ingredient_cost = user.user_ingredient_costs.find(params[:id])
    
    # Return ingredient 
    if user_ingredient_cost && !user_ingredient_cost.nil? 
      render json: UserIngredientCostSerializer.new(user_ingredient_cost).serialized_json, status: 200
    else
      render json: { message: 'Ingredient not found' }
    end
  end

  # Create record
  def create
    # redirect_non_users

    user = User.find_by(id: params[:user_id])
    params[:user_ingredient_cost][:ingredient_id] = params[:user_ingredient_cost][:id]

    # Ensure current user can create for user
    # require_authorization(@user)

    # Create ingredient
    # @user_ingredient_cost = @user.user_ingredient_costs.build(ing_params)
    user_ingredient_cost = user.user_ingredient_costs.build(params.require(:user_ingredient_cost).permit(:id, :ingredient_id, :cost, :cost_size, :cost_unit))
  
    if user_ingredient_cost.save
      render json: UserIngredientCostSerializer.new(user_ingredient_cost).serialized_json, status: 200
    else
      render json: { message: 'Ingredient error' }
    end
  end

  # Update record
  def update
    # redirect_non_users
    user = User.find_by(id: params[:user_id])
    
    # Require authorization
    # require_authorization(@user)

    # Find and update record
    user_ingredient_cost = @user.user_ingredient_costs.find(params[:id])
    user_ingredient_cost.update(params.require(:user_ingredient_cost).permit(:id, :cost, :cost_size, :cost_unit))

    if user_ingredient_cost.save
      if recipe.save
        render json: UserIngredientCostSerializer.new(user_ingredient_cost).serialized_json, status: 200
      else
        render json: { message: 'Ingredient error' }
      end
  end

  # Delete record
  def destroy
    # redirect_non_users
    user = User.find_by(id: params[:user_id])

    # Require authorization
    # require_authorization(user)

    # Find and destroy record
    user_ingredient_cost = user.user_ingredient_costs.find(params[:id])
    user_ingredient_cost.destroy

    render json: {recipeId: user_ingredient_cost.id}, status: 200
  end

  private

  def ing_params
    params.require(:user_ingredient_cost).permit(:id, :cost, :cost_size, :cost_unit)
  end

end
