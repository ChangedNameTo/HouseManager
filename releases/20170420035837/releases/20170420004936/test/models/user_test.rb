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
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
