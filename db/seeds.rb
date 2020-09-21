# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

require 'open-uri'
require 'json'

puts "Cleaning database.."
Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredientsList = open(url).read
ingredients = JSON.parse(ingredientsList)

puts "Saving new ingredients"
ingredientArray = ingredients["drinks"]
ingredientArray.each do |ingredient|
  new_ingredient = Ingredient.new(name: ingredient["strIngredient1"])
  new_ingredient.save
end

puts "Finished!"