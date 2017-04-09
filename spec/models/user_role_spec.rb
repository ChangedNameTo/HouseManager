# == Schema Information
#
# Table name: user_roles
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  role_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'
require Rails.root.join('spec', 'models', 'shared_examples', 'non_null_field.rb')

describe UserRole do
  it "has a valid factory" do
    expect(build(:user_role)).to be_valid
  end

  describe 'user', field: :user do
    it_behaves_like 'non null field'
  end

  describe 'role', field: :role do
    it "is invalid without a unique role per user" do
      user_role = create(:user_role)

      expect(build(:user_role, role: user_role.role, user: user_role.user)).not_to be_valid
    end

    it_behaves_like 'non null field'
  end
end
