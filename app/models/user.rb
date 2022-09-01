class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable, :confirmable

  has_many :diets, through: :diet_user_assignments
  has_many :meals

  def author?(obj)
    obj.user == self
  end
end
