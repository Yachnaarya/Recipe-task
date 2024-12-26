class RecipesController < ApplicationController
	def index
	    @recipes = Recipe.all
	  end
	 
	  def show
	    @recipe = Recipe.find(params[:id])
	  end
	 
	  def new
	    @recipe = Recipe.new
	  end
	 
	  def edit
	    @recipe = Recipe.find(params[:id])
	  end
	 
	  def create
	    @recipe = Recipe.new(recipe_params)
	    if @recipe.save
	      redirect_to @recipe
	    else
	      render 'new'
	    end
	  end
	 
	  def search_recipe 
	      @recipe = Recipe.where("name LIKE ?","#{params[:name]}%")
		  @ingredient = Ingredient.where("ingredient LIKE ?","#{params[:ingredient]}%")
		   if params[:name].eql?("") && params[:ingredient].eql?("")
		   	render 'no_data'

		   else
		  	@recipe.each do |recipe|
		  		redirect_to listing_result_recipes_path(recipe)
		  	end
			end

	  end

	  def listing_result
	  	@recipe = Recipe.find(params["format"].to_i)
	      render 'listing_result'

	  end
	 
	  private
	    def recipe_params
	      params.require(:recipe).permit(:name, :instructions, :cooking_time)
	    end
end
