class AddAmountToRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :recipe_ingredients, :amount, :string
    
  end
end
