# == Schema Information
#
# Table name: organizations
#
#  id                   :integer          not null, primary key
#  full_name            :string           not null
#  abbreviation         :string           not null
#  school               :string           not null
#  address              :string           not null
#  organization_manager :integer
#  user_manager         :integer
#  kitchen_manager      :integer
#  house_manager        :integer
#  service_manager      :integer
#  scholarship_manager  :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
