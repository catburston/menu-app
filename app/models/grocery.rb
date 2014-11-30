class Grocery < ActiveRecord::Base
  has_and_belongs_to_many :shopping_lists
end
