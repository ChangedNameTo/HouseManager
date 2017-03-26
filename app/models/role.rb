class Role < ApplicationRecord
  # Associations
  has_many :user_roles
  has_many :users, through: :user_roles

  # Validations
  validates :label, 
    presence: true, 
    uniqueness: { case_sensitive: false }

  validates :description, 
    presence: true

  def label_with_description
    "#{label}"

  end

  def label_with_description
    "#{label} - #{description}"

  end
end
