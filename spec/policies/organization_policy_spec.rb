require 'rails_helper'

RSpec.describe OrganizationPolicy do
  let(:user) { create(:user) }
  let(:member) { create(:user, :member) }
  let(:sys_admin) { create(:user, :sys_admin) }
  let(:org_man) { create(:user, :org_man) }
  let(:user_man) { create(:user, :user_man) }

  subject { described_class }

  # Only the system admin can create, index, delete organizations
  permissions :index?, :destroy?, :create? do
    it 'denies access if user is not the system admin' do
      expect(subject).not_to permit(user)
    end

    it 'allows access if user is the system admin' do
      expect(subject).to permit(sys_admin)
    end
  end

  # The organization manager and system admin can edit organizations
  permissions :edit? do
    it 'denies permission if the user is not the org manager or sys admin' do
      expect(subject).not_to permit(user, member, user_man)
    end

    it 'allows permission if the user is the org man or sys admin' do
      expect(subject).to permit(org_man, sys_admin)
    end
  end

  permissions :show? do
    it 'denies permission if the user is not a member' do
      expect(subject).not_to permit(user)
    end

    it 'allows permission if the user is a member' do
      expect(subject).to permit(member)
    end
  end
end
