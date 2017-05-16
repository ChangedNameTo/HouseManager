# == Schema Information
#
# Table name: maintenance_requests
#
#  id              :integer          not null, primary key
#  issue_title     :string           not null
#  description     :string           not null
#  reporter_id     :integer          not null
#  organization_id :integer          not null
#  priority_id     :integer          not null
#  started         :boolean          default(FALSE)
#  finished        :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class MaintenanceRequest < ApplicationRecord
  # Callbacks
  after_commit :send_new_maintenance_request_email, on: :create

  # Association
  belongs_to :user, foreign_key: 'reporter_id'
  belongs_to :organization, foreign_key: 'organization_id'
  belongs_to :maintenance_request_priority, foreign_key: 'priority_id'
  has_many :maintenance_request_comments, dependent: :destroy

  accepts_nested_attributes_for :maintenance_request_comments

  # Validations
  validates :issue_title, presence: true

  validates :description, presence: true

  validates :reporter_id, presence: true

  validates :organization_id, presence: true

  validates :priority_id, presence: true

  # Model Functions
  def priority_label
    MaintenanceRequestPriority.find(self.priority_id).priority_label
  end

  def priority_label_short
    MaintenanceRequestPriority.find(self.priority_id).priority_label_short
  end

  def reporter_image
    User.find(self.reporter_id).image
  end

  def reporter_name
    User.find(self.reporter_id).full_name
  end

  def post_date
    created_at.strftime("%m/%d/%Y")
  end

  def updated_date
    updated_at.strftime("%m/%d/%Y")
  end

  private

  def send_new_maintenance_request_email
    users = User.joins(:roles).where(affiliated_organization: self.organization_id).where(roles: {label: ['House Manager', 'Organization Manager']}).distinct.pluck(:email_address)

    NotificationMailer.new_maintenance_request_email(
      users,
      self.id
    ).deliver_later(wait: 1.seconds)
  end
end
