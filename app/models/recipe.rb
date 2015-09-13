class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :menus
  belongs_to  :user
  validates :user_id, presence: true
  before_save  :capitalize_name
  def capitalize_name
    self.name.capitalize!
  end
end
