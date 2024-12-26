class IngredientsController < ApplicationController
	def create
	  @recipe = Recipe.find(params[:recipe_id])
	  @ingredient = @recipe.ingredients.create(ingredients_params)
	  redirect_to recipes_path
	end
	
	private
	  def ingredients_params
	    params.require(:ingredient).permit(:name)
	  end
end
