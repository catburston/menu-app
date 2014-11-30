class WelcomeController < ApplicationController
  def index
    @shopping_list = ShoppingList.last
    ingredients = @shopping_list.ingredients
    @ingredient_list = ingredients.group("ingredients.name").count
    groceries = @shopping_list.groceries
    @grocery_list = groceries.group("groceries.name").count
  end
end
