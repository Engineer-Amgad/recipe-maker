class IngredientsController < ApplicationController

    def index
        get_recipe
    end 

    def new
        get_recipe
    end 

    def get_recipe
        @recipe ||= Recipe.find_by(id: params[:recipe_id])
    end
end
