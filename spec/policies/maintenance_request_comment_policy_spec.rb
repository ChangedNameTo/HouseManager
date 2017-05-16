require 'rails_helper'

RSpec.describe MaintenanceRequestCommentPolicy do
  let(:user) { create(:user) }
  let(:member) { create(:user, :member) }
  let(:member2) { create(:user, :member) }
  let(:sys_admin) { create(:user, :sys_admin) }
  let(:org_man) { create(:user, :org_man) }
  let(:user_man) { create(:user, :user_man) }
  let(:kit_man) { create(:user, :kit_man) }
  let(:house_man) { create(:user, :house_man) }

  subject { described_class }

  # Members can make maintenance requests, update them if they are theirs
  permissions :update?, :edit?, :destroy? do
    it 'denies access if user not changing their own' do
      expect(subject).not_to permit(member, member2)
    end

    it 'allows you if updating your own' do
      expect(subject).to permit(member, member)
    end
  end

  # Org mans, and kitchen mans can delete plates. Members can delete their own plates
  permissions :create?, :new? do
    it 'denies if they are not a member' do
      expect(subject).not_to permit(user)
    end

    it 'allows if they are a member' do
      expect(subject).to permit(member)
    end
  end
end
