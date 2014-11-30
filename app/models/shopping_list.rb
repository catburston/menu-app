class ShoppingList < ActiveRecord::Base
  has_and_belongs_to_many :groceries
  has_many :ingredients, through: :menu
  belongs_to :menu
end
