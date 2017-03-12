class User < ApplicationRecord

  # Scopes

  # Associations
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles, dependent: :destroy

  # Validation
  validates :first_name, presence: true, 
    length: { minimum: 1 }

  validates :last_name, presence: true, 
    length: { minimum: 1 }

  validates :email_address, presence: true, 
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "Not a valid email address" }

  validates :phone_number, presence: true, 
    length: { minimum: 1 }

  # Model Functions
  def full_name
    "#{first_name} #{last_name}"

  end

end
