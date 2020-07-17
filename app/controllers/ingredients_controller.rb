class IngredientsController < ApplicationController

    def index
        get_recipe
    end 

    def new
        @recipe = Recipe.find(params[:recipe_id])
        @ingredients = 6.times.collect { @recipe.recipe_ingredients.build }
        
    end 

    def create
        raise params.inspect
    end 

    def get_recipe
        @recipe ||= Recipe.find_by(id: params[:recipe_id])
    end
end