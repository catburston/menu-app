class AddMenuIdToShoppingList < ActiveRecord::Migration
  def change
    add_column :shopping_lists, :menu_id, :integer
  end
end
