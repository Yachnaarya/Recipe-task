class SearchController < ApplicationController
	def search
	  @results = Recipe.search(params[:search])
	  render turbo_stream:
	    turbo_stream.update('recipe', partial: 'recipe/recipe', locals: {recipe: @results})
	end

end
