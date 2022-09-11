class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable, :confirmable

  has_many :diet_user_assignments
  has_many :diets, through: :diet_user_assignments
  has_many :meals

  validates_presence_of :email
  validates_presence_of :password
end
