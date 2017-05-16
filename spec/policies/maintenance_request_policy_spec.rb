require 'rails_helper'

RSpec.describe MaintenanceRequestPolicy do
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
    it 'denies access if user is not a member' do
      expect(subject).not_to permit(user)
    end

    it 'denies you from updating someone elses' do
      expect(subject).not_to permit(member, member2)
    end

    it 'allows if user is updating their own request' do
      expect(subject).to permit(member, member)
    end

    it 'allows if the user is a org manager or house manager' do
      expect(subject).to permit(org_man)
      expect(subject).to permit(house_man)
      expect(subject).to permit(sys_admin)
    end
  end

  # Org mans, and kitchen mans can delete plates. Members can delete their own plates
  permissions :show?, :index?, :create?, :new? do
    it 'denies if they are not a member' do
      expect(subject).not_to permit(user)
    end

    it 'allows if they are a user' do
      expect(subject).to permit(member)
    end
  end

  permissions :change_started_status?, :change_finished_status? do
    it "denies if they are not a sys admin house manager or org manager" do
      expect(subject).not_to permit(user)
      expect(subject).not_to permit(member)
    end

    it 'allows if they are a sys admin house manager or org manager' do
      expect(subject).to permit(org_man)
      expect(subject).to permit(house_man)
      expect(subject).to permit(sys_admin)
    end
  end
end
