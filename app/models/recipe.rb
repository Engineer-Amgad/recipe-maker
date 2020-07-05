class Recipe < ApplicationRecord
    #belongs_to :user
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    
    validates :name, uniqueness: true
    validates :name, presence: true

    accepts_nested_attributes_for :ingredients, reject_if: lambda {|attributes| attributes['name'].blank?}
    accepts_nested_attributes_for :recipe_ingredients, reject_if: lambda {|attributes| attributes['name'].blank?}

    scope :fastest, -> { order("time_in_minutes ASC") }

    include ActionView::Helpers::TextHelper

    def delete_ingredients_from_recipe
        ingredients.size.times do
        ingredient = RecipeIngredient.find_by(recipe_id: self.id)
        ingredient.delete
      end
    end
  
    def add_ingredients_to_recipe(params)
  
      delete_ingredients_from_recipe
      
      params[:recipe_ingredients_attributes].each do |k, recipe_ingredient|
  
        if recipe_ingredient[:ingredient][:name].present?
          ingredient_name = recipe_ingredient[:ingredient][:name].downcase
          ingredient = Ingredient.find_or_create_by(name: ingredient_name)
        elsif recipe_ingredient[:ingredient_id].present?
          ingredient = Ingredient.find_by(id: recipe_ingredient[:ingredient_id])
        end
  
        if recipe_ingredient[:amount].present?
          RecipeIngredient.create(amount: recipe_ingredient[:amount], ingredient_id: ingredient.id, recipe_id: self.id )
        end
  
      end
  
    end

    
    # def ingredients_attributes=(ingredient_attributes)
    #     ingredient_attributes.values.each do |ingredient_attribute|
    #       ingredient = Ingredient.find_or_create_by(ingredient_attribute)
    #       self.recipe_ingredients.build(ingredient: ingredient)
    #     end
    # end

#     <h2>Create a New Recipe</h2>


# <%= form_for @recipe do |f| %>
#     <%= f.label "Name" %>
#     <%= f.text_field :name %><br>
#     <%= f.label "Prepartion Time" %>
#     <%= f.text_field :make_time %>Minutes<br>
#     <%= f.label "Instructions" %><br>
#     <%= f.text_area :instructions %><br>
    
#     Add Ingredients:<br>
#     <%= ingredients_fields.text_field :amount %><br><br>
    
#     <%= f.collection_check_boxes :ingredient_ids, Ingredient.all, :id, :name %><br>
#     <%= f.fields_for :ingredients, @recipe.ingredients.build do |ingredients_fields| %><br>
#       <%= ingredients_fields.text_field :name %><br><br>
#     <% end %>
#     <%= f.submit %>

#   <% end %>
end
