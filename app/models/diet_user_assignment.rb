class DietUserAssignment < ApplicationRecord
  has_one :user
  has_one :diet
end
