# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ingredient = Ingredient.create(name: "Apple")
ingredient = Ingredient.create(name: "rice")
ingredient = Ingredient.create(name: "water")
ingredient = Ingredient.create(name: "salt")
ingredient = Ingredient.create(name: "Black pepper")
ingredient = Ingredient.create(name: "Chicken")
ingredient = Ingredient.create(name: "Lettus")
ingredient = Ingredient.create(name: "Tomatoes")
ingredient = Ingredient.create(name: "Meat")
ingredient = Ingredient.create(name: "Eggs")

recipe = Recipe.new(name: "salad")
recipe.description = "cut salad and add salt"
recipe.ingredient_id = 1
recipe.save

