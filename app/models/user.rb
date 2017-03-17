class User < ApplicationRecord

  # Scopes

  # Associations
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles, dependent: :destroy
  belongs_to :organization, optional: true

  # Validation
  validates :first_name, presence: true,
    length: { minimum: 1 }

  validates :last_name, presence: true,
    length: { minimum: 1 }

  validates :email_address, presence: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "Not a valid email address" }

  # Helpers
  def full_name
    "#{first_name} #{last_name}"
  end

  def has_role?(roles)
    roles.each do |role|
      if self.roles.include? role
        return true
      end
    end

    false
  end

	def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.email_address = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

end
