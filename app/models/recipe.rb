class Recipe < ApplicationRecord
    # belongs_to :user
    belongs_to :ingredient
    validates_presence_of :name
    validates_presence_of :description

end
