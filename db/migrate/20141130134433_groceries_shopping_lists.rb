class GroceriesShoppingLists < ActiveRecord::Migration
  def change
    create_table :groceries_shopping_lists, :id => false do |t|
      t.integer :grocery_id
      t.integer :shopping_list_id
    end
  end
end
