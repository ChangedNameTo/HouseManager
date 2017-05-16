# == Schema Information
#
# Table name: maintenance_request_priorities
#
#  id          :integer          not null, primary key
#  label       :string           not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class MaintenanceRequestPriority < ApplicationRecord
  belongs_to :maintenance_request, optional: true

  # Model Functions
  def priority_label
    "#{id} - #{label} (#{description})"
  end

  def priority_label_short
    "#{id} - #{label}"
  end
end
