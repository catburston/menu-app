class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  before_save  :capitalize_name
  def capitalize_name
    self.name.capitalize!
  end
end
