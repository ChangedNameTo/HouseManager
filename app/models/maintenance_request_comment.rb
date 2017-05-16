# == Schema Information
#
# Table name: maintenance_request_comments
#
#  id                     :integer          not null, primary key
#  maintenance_request_id :integer          not null
#  body                   :string           not null
#  author_id              :integer          not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class MaintenanceRequestComment < ApplicationRecord
  # Associations
  belongs_to :maintenance_request, foreign_key: 'maintenance_request_id'
  belongs_to :author, class_name: User, foreign_key: 'author_id'

  # Validations
  validates :maintenance_request_id, presence: true

  validates :body, presence: true

  validates :author_id, presence: true

  def author_image
    User.find(self.author_id).image
  end

  def author_name
    User.find(self.author_id).full_name
  end

  def post_date
    created_at.strftime("%m/%d/%Y")
  end
end
