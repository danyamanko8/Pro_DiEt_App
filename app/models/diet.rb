class Diet < ApplicationRecord
  has_one :owner, class_name: 'User', foreign_key: 'owner_id'

  validates_presence_of :name
  validates_presence_of :components
  validates_presence_of :description

  scope :without_owner, -> { where(owner_id: nil) }
end
