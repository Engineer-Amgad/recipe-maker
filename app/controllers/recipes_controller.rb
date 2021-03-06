class RecipesController < ApplicationController
    before_action :authentication_required

    def index
        if params[:user_id]

            @recipes = Recipe.find_by_user_id(params[:user_id])
        else
            @recipes = Recipe.all
        end
    end 

    def new
        @recipe = Recipe.new
        @ingredients = 6.times.collect { @recipe.recipe_ingredients.build }
    end 

    def show
        @recipe = Recipe.find(params[:id])
    end

    def create
        @recipe = current_user.recipes.new(recipe_params)
        if @recipe.save
            @recipe.add_ingredients_to_recipe(recipe_ingredient_params)
            redirect_to recipes_path
        else
            @ingredients = 6.times.collect { @recipe.recipe_ingredients.build }
            render 'recipes/new'
        end 
    end 

    def update
        # raise params.inspect
        # recipe = Recipe.find_by_id(Recipe)
        recipe = Recipe.find(params[:id])
        # if recipe.update(recipe_params)
            recipe.add_ingredients_to_recipe(recipe_ingredient_params)
            redirect_to recipe_path(recipe), notice: "Your recipe has successfully been updated"
        # else 
        #     redirect_to new_recipe_path, alert: recipe.errors.full_messages.each {|m| m}.join
        # end
    end 

    private

    def recipe_params
        params.require(:recipe).permit(:name, :make_time, :instructions)
    end 

    def recipe_ingredient_params
        params.require(:recipe).permit(recipe_ingredients_attributes: [:amount, :ingredient_id, ingredient: [:name]])
    end

   
end
