class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :recipe_category
      t.string :recipe_type
      t.string :chef

      t.timestamps
    end
  end
end
