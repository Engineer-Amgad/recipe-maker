class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_ingredients
    has_man :ingredients, through: :recipe_ingredients
    
    validates_presence_of :name

end
