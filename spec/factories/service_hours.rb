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

FactoryGirl.define do
  factory :service_hour do
  end
end
