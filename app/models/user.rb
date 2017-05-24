# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  first_name              :string           not null
#  last_name               :string           not null
#  phone_number            :string
#  enabled                 :boolean          default(FALSE), not null
#  email_address           :string           not null
#  provider                :string           not null
#  uid                     :string           not null
#  oauth_token             :string           not null
#  oauth_expires_at        :datetime         not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  affiliated_organization :integer
#  image                   :string
#  number                  :integer
#  big                     :integer
#

class User < ApplicationRecord
  # Callbacks

  # This doesn't work atm
  after_commit :send_welcome_email, on: :create

  # Associations
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles, dependent: :destroy
  has_many :late_plates, dependent: :destroy
  has_many :announcements, dependent: :destroy
  has_many :maintenance_requests, dependent: :destroy
  has_many :maintenance_request_comments, dependent: :destroy
  belongs_to :organization, optional: true

  # Validation
  validates :first_name, presence: true,
    length: { minimum: 1 }

  validates :last_name, presence: true,
    length: { minimum: 1 }

  validates :email_address, presence: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "Not a valid email address" }

  validates :provider, presence: true

  validates :uid, presence: true,
    uniqueness: {
      case_sensitive: false,
      scope: :provider,
      message: "UIDs must be unique"
  }

	validates :oauth_token,
    presence: true

  validates :oauth_expires_at,
    presence: true

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

  def is_member?(organization)
    if self.affiliated_organization
      if self.enabled
        return true
      end
    end

    false
  end

  def service_hours
    @hours = ServiceHour.where(recipient_id: self.id)

    total = 0

    @hours&.each do |hour|
      total = total + hour.hours_and_money
    end

    return total
  end

	def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.email_address = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.image = auth.info.image
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  private

  def send_welcome_email
    users = User.joins(:roles).where(roles: {label: ['Organization Manager', 'User Manager']}).where(affiliated_organization: self.affiliated_organization)

    users.each do |recipient|
      # Need to make a notification table
    end

    NotificationMailer.welcome_email(
      users.pluck(:email_address),
      self.id
    ).deliver_later(wait: 1.seconds)
  end
end
