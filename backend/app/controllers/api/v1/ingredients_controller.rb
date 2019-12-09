class Api::V1::IngredientsController < ApplicationController
  # before_action :require_admin, only: [:import]
  # before_action :set_user

  # Send all ingredients
  def index
    ingredients = Ingredient.all.order(name: :asc)

    render json: IngredientSerializer.new(ingredients).serialized_json, status: 200
  end



  # All records
  # def index
  #   @ingredients = Ingredient.all.order(name: :asc)
  # end

  # Display new form
  # def new
  #   @ingredient = Ingredient.new
  # end

  # Create record
  # def create
  #   # Make name lowercase
  #   params[:ingredient][:name] = params[:ingredient][:name].downcase
  #   ingredient = Ingredient.new(ing_params)
  #   if ingredient.save
  #     redirect_to ingredients_path
  #   else
  #     flash[:error] = ingredient.errors.full_messages
  #     redirect_to new_ingredient_path
  #     # render 'new'
  #   end
  # end

  # Display edit form
  # def edit
  #   @ingredient = Ingredient.find_by(id: params[:id])

  #   redirect_to ingredients_path, alert: "Ingredient not found." if @ingredient.nil?
  # end

  # Update record
  # def update
  #   # Make name lowercase
  #   params[:ingredient][:name] = params[:ingredient][:name].downcase

  #   @ingredient = Ingredient.find_by(id: params[:id])
  #   @ingredient.update(ing_params)

  #   if @ingredient.save
  #     flash[:success] = "Success! #{@ingredient.name.capitalize} updated."
  #     redirect_to ingredients_path
  #   else
  #     render :edit
  #   end  
  # end

  # Import CSVs
  # def import
  #   Ingredient.import(params[:file])
  #   redirect_to ingredients_path, notice: "Success! File imported."
  # end

  # Delete record
  # def destroy
  #   ingredient = Ingredient.find(params[:id])
  #   ingredient.destroy
  #   flash[:notice] = "Ingredient deleted."
  #   redirect_to ingredients_path
  # end

  private

  def set_user
    @user = current_user
  end

  def ing_params
    params.require(:ingredient).permit(:name, :cost, :cost_size, :cost_unit)
  end

end
