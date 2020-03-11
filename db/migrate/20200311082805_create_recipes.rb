class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :user_id
      t.string :ingredient_id
      t.text :description
      
      t.timestamps
    end
  end
end
