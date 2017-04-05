# == Schema Information
#
# Table name: late_plates
#
#  id              :integer          not null, primary key
#  day             :date             not null
#  completed       :boolean          default(FALSE), not null
#  meal_id         :integer          not null
#  user_id         :integer          not null
#  organization_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class LatePlateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
