class Meal < ApplicationRecord
  has_one :user
  validates_presence_of :title
end
