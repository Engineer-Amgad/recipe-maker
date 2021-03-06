class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    
    validates :name, :presence => true
    validates :name, :uniqueness => true
    
    accepts_nested_attributes_for :ingredients, reject_if: lambda {|attributes| attributes['name'].blank?}
    accepts_nested_attributes_for :recipe_ingredients, reject_if: lambda {|attributes| attributes['name'].blank?}

    def user_name
      user.username
    end

    def self.find_by_user_id(id)
      #find all recipes where user_id == id
      where(user_id: id)
    end 
  
    def add_ingredients_to_recipe(params)
  
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
end
