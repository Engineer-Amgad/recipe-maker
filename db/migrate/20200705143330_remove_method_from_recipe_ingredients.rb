class RemoveMethodFromRecipeIngredients < ActiveRecord::Migration[6.0]
  def change

    remove_column :recipe_ingredients, :method, :text
  end
end
