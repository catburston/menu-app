class Menu < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  has_many :ingredients, through: :recipes
  has_one :shopping_list
  before_save  :capitalize_name
  def capitalize_name
    self.name.capitalize!
  end
end
