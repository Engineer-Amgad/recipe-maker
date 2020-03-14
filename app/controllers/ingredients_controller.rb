class IngredientsController < ApplicationController

    def index
        @recipe = Recipe.find_by(id: params[:recipe_id])
    end 
end
