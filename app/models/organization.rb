class Organization < ApplicationRecord
  has_one :user, foreign_key: 'organization_manager'
end
