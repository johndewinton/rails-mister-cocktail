# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

require 'open-uri'
# https://github.com/flori/json
require 'json'
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ingredients = Ingredient.create([{name: "lemon"}, {name: "ice"}, {name: "mint leaves"}, {name: "tomato sauce"}, {name: "panchetta"}, {name: "pasta"}])
url =  "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
read_file = open(url).read
result = JSON.parse(read_file)
result.each do |r|
  answer = p "#{r["strIngredient1".to_i]}"
   answer.each do |a|
    p "#{a["strIngredient1"]}"
  end
end

