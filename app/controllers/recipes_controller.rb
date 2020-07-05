class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
    end 

    def new
        @recipe = Recipe.new
        @ingredients = 6.times.collect { @recipe.recipe_ingredients.build }
    end 

    def show
        @recipe = Recipe.find(params[:id])
    end

    def create
        # raise params.inspect
        recipe = Recipe.new(recipe_params)
        if recipe.save
            recipe.add_ingredients_to_recipe(recipe_ingredient_params)
            redirect_to recipes_path
        else
            @recipe = Recipe.new
            redirect_to new_recipe_path, alert: recipe.errors.full_messages.each {|m| m}.join
        end 
    end 

    private

    def recipe_params
        params.require(:recipe).permit(:name, :make_time, :instructions)
    end 

    def recipe_ingredient_params
        params.require(:recipe).permit(recipe_ingredients_attributes: [:amount, :ingredient_id, ingredient: [:name]])
    end

   
end
