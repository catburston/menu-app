class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :menus
  before_save  :capitalize_name
  def capitalize_name
    self.name.capitalize!
  end
end
