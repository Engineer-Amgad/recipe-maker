class AddMakeTimeToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :make_time, :integer
  end
end
