# == Schema Information
#
# Table name: meals
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  time            :time             not null
#  organization_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class MealTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
