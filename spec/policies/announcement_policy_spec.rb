require 'rails_helper'

RSpec.describe AnnouncementPolicy do
  let(:user) { create(:user) }
  let(:sys_admin) { create(:user, :sys_admin) }
  let(:org_man) { create(:user, :org_man) }
  let(:user_man) { create(:user, :user_man) }

  subject { described_class }

  # Any user can create an announcement if they have member role
  permissions :create?, :index?, :show? do
    it 'denies access if user is not a member' do
      expect(subject).not_to permit(user)
    end

    it 'allows creation if user is a member' do
      UserRole.create(
        user: user,
        role: Role.find_by(label: 'Member')
      )

      expect(subject).to permit(user)
    end
  end

  permissions :update?, :destroy? do
    it 'denies permission if the user is not the poster' do
      expect(subject).not_to permit(user)
    end

    it 'denies permission if the user is not an Organization Manager or Sys Admin' do
      expect(subject).not_to permit(user)
    end

    it 'allows permission if the user is the poster' do
      expect(subject).to permit(user, user)
    end

    it 'allows permission if the user is an Organizaton Manager' do
      expect(subject).to permit(org_man)
    end

    it 'allows permission if the user is a System Admin' do
      expect(subject).to permit(sys_admin)
    end
  end

end
