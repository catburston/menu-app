# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env == "development" || Rails.env == "test"
  puts "Cleaning DB first ..."
  Menu.destroy_all
  Recipe.destroy_all
  Ingredient.destroy_all
end

MENUS = 5

puts "Creating Ingredients"
ingredientsArray = ['allspice', 'baking powder', 'bay leaves', 'broccoli', 'brown sugar', 'bulghur', 'butter', 'capers', 'cardamom pods', 'carrot', 'cauliflower', 'celery', 'cheddar', 'chilli powder', 'chilli sauce', 'chillies', 'cinnamon', 'cloves', 'coriander', 'coriander powder', 'creme fraiche', 'cumin seeds', 'curry leaves', 'dill', 'egg', 'eggplant', 'fennel', 'fetta', 'filo', 'flatbreads', 'flour', 'frozen peas', 'frozen spinach', 'garlic', 'ginger', 'goat cheese', 'gorgonzola', 'green olives', 'heavy cream', 'hokkien noodles', 'kasoori methi', 'leeks', 'lemon', 'lime', 'linguine', 'marjoram', 'milk', 'mint', 'mozzarella', 'mushroom', 'mustard seeds', 'nutmeg', 'olive oil', 'onions', 'oregano', 'orzo', 'panch phora', 'parmesan', 'parsley', 'pasta', 'pastry shell', 'pecorino', 'peppercorns', 'potatoes', 'red onion', 'red peppers', 'rice noodles', 'rocket', 'salted peanuts', 'scallions', 'shahi jeera', 'sour cream', 'soy sauce', 'spring onions', 'sriracha', 'star anise', 'swiss cheese', 'tarragon', 'tin lentils', 'tin tomatoes', 'tofu (fried)', 'tofu (hard)', 'tomato', 'tomato paste', 'tomato sauce ', 'tumeric', 'vegetable oil', 'vegetable stock', 'walnuts', 'white vinegar', 'yoghurt', 'zucchini']
ingredient_sections = ['dairy', 'bread', 'fruit and veg', 'tinned goods', 'cleaning', 'market']

(1..ingredientsArray.length-1).each do |index|
  Ingredient.create!(name: ingredientsArray[index-1], shop_section: ingredient_sections.sample)
end
puts "#{ingredientsArray.length} ingredients created"

puts "Creating Recipes"
recipesArray = ['aloo gobi', 'baked eggplant pasta', 'baked leek and walnut penne', 'baked tomato pasta sauce', 'bechamel and roast veg', 'bowl o veg', 'broccoli chilli pasta', 'caponata', 'cauliflower cheese', 'dahl', 'fennel salad', 'fried rice', 'frittata', 'fritters (broccoli)', 'fritters (cauliflower)', 'fritters (zucchini)', 'grain salad', 'laksa soup', 'macaroni cheese', 'margarita pizza', 'mee goreng', 'mushroom and pesto pizza', 'mushroom quiche', 'muttar paneer', 'pad thai', 'pakora', 'palak gobi', 'pasta mozzarella salad', 'pumpkin soup', 'red pepper alfredo', 'red pepper soup', 'risotto (mushroom)', 'saag paneer', 'samosas', 'shepherd pie', 'spanakopita', 'tabbouleh', 'tex mex', 'veggie pasta', 'veggie soup', 'zucchini coconut curry']
recipe_categories = ['pasta', 'rice', 'soup', 'salad', 'other']
recipe_types = ['schoolnight', 'potheavy', 'main', 'side', 'dessert']
recipe_chefs = ['Cat', 'Tom']

(1..recipesArray.length-1).each do |index|
  Recipe.create!(name: recipesArray[index-1], recipe_type: recipe_types.sample, recipe_category: recipe_categories.sample, chef: recipe_chefs.sample)
end
allrecipes = Recipe.all.to_a
puts "#{recipesArray.length} recipes created"


puts "Creating Menus"
(1..MENUS).each do |index|
  Menu.create!(name: "Menu No. " + index.to_s)
end

menus = Menu.all.to_a
menus.each do |m, index|
  (3..6).each do
    m.recipes << allrecipes.sample
  end
end
puts "#{menus.length} menus created"
