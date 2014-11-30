class Grocery < ActiveRecord::Base
  has_and_belongs_to_many :shopping_lists
  before_save  :capitalize_name
  def capitalize_name
    self.name.capitalize!
  end
end
