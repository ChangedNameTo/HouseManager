require 'rails_helper'

RSpec.describe MealPolicy do
  let(:user) { create(:user) }
  let(:member) { create(:user, :member) }
  let(:sys_admin) { create(:user, :sys_admin) }
  let(:org_man) { create(:user, :org_man) }
  let(:user_man) { create(:user, :user_man) }
  let(:kit_man) { create(:user, :kit_man) }

  subject { described_class }

  # Only org mans, sys admins, and kitchen mans can do anything
  permissions :create?, :index?, :show?, :destroy?, :update? do
    it 'denies access if user is not a the org man, sys admin, or kitchen man' do
      expect(subject).not_to permit(user)
    end

    it 'allows if user is a org man, sys admin, or kitchen man ' do
      expect(subject).to permit(sys_admin, org_man, kit_man)
    end
  end
end
