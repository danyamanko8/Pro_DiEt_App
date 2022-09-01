class Meal < ApplicationRecord
  has_one :user
  include Authorship
end
