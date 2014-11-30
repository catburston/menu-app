class MenusRecipes < ActiveRecord::Migration
  def change
    create_table :menus_recipes, :id => false do |t|
      t.integer :menu_id
      t.integer :recipe_id
    end
  end
end
