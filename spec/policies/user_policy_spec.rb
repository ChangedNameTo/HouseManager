require 'rails_helper'

RSpec.describe UserPolicy do
  let(:user) { create(:user) }
  let(:member) { create(:user, :member) }
  let(:sys_admin) { create(:user, :sys_admin) }
  let(:org_man) { create(:user, :org_man) }
  let(:user_man) { create(:user, :user_man) }

  subject { described_class }

  # Only the system admin can index or delete users
  permissions :index?, :destroy? do
    it 'denies access if user is not the system admin' do
      expect(subject).not_to permit(user)
    end

    it 'allows permission if the user is a System Admin' do
      expect(subject).to permit(sys_admin)
    end
  end

  # Allows updating if the user is themself or the system admin
  permissions :update? do
    it 'denies permission if the user is not themself' do
      expect(subject).not_to permit(user)
    end

    it 'allows if the user is themself' do
      expect(subject).to permit(user, user)
    end

    it 'denies permission if the user is not an Sys Admin' do
      expect(subject).not_to permit(user)
    end

    it 'allows if the user is an Sys Admin' do
      expect(subject).to permit(sys_admin)
    end
  end

  # Allows these actions if you are a sys admin, org man, or user man
  permissions :update_positions?, :organization_enable?, :organization_disable? do
    it 'denies permission if the user is not an Sys Admin, org man or user man' do
      expect(subject).not_to permit(user)
    end

    it 'allows if the user is an Sys Admin' do
      expect(subject).to permit(sys_admin, org_man, user_man)
    end

  end
end
