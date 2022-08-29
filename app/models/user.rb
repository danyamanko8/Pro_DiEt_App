class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable, :confirmable

  has_many :diets
  has_many :meals
end
