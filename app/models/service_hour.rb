# == Schema Information
#
# Table name: service_hours
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  for          :string           not null
#  description  :string           not null
#  day          :date             not null
#  hours        :decimal(, )
#  money        :decimal(, )
#  recipient_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ServiceHour < ApplicationRecord
  # Associations
  belongs_to :recipient, class_name: User, foreign_key: 'recipient_id'

  # Validations
  validates :title, presence: true

  validates :description, presence: true

  validates :recipient_id, presence: true

  validates :for, presence: true

  # Model Functions
  def money_to_hours
    if money
      money / 15
    else
      0
    end
  end

  def hours_and_money
    hours + money_to_hours
  end

end
