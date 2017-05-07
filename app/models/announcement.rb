# == Schema Information
#
# Table name: announcements
#
#  id              :integer          not null, primary key
#  title           :string           not null
#  body            :string           not null
#  author_id       :integer          not null
#  organization_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Announcement < ApplicationRecord
  # Callbacks
  after_commit :send_new_announcement_email, on: :create

  # Associations
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :organization, foreign_key: 'organization_id'

  # Validation
  validates :title, presence: true

  validates :body, presence: true

  validates :author_id, presence: true

  validates :organization_id, presence: true

  # Methods
  def author_name
    User.find(self.author_id).full_name
  end

  def post_date
    created_at.strftime("%m/%d/%Y")
  end

  def author_image
    User.find(self.author_id).image
  end

  private

  def send_new_announcement_email
    users = User.where(affiliated_organization: self.organization_id)

    users.each do |recipient|
      # Need to make a notification table
    end

    NotificationMailer.new_announcement_email(
      users.pluck(:email_address),
      self.id
    ).deliver_later(wait: 1.seconds)
  end
end
