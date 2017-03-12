class Organization < ApplicationRecord
  has_one :user, foreign_key: 'Organization Manager'
end
