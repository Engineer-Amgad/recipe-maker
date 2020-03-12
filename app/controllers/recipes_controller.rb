class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
    end 

    def new
        @recipe = Recipe.new
    end 

    def create

    end 

    private

    def recipe_params
        params.require(:recipe).permit(:name, :description)
    end 
end
