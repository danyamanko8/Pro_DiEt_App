class Diet < ApplicationRecord
  include Authorship
  has_one :owner, class_name: 'User', foreign_key: 'owner_id', allow_nil: true

  scope: :without_owner, { where(owner_id: nil) }
end
