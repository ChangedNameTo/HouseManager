require 'rails_helper'

RSpec.describe LatePlatePolicy do
  let(:user) { create(:user) }
  let(:member) { create(:user, :member) }
  let(:sys_admin) { create(:user, :sys_admin) }
  let(:org_man) { create(:user, :org_man) }
  let(:user_man) { create(:user, :user_man) }
  let(:kit_man) { create(:user, :kit_man) }

  subject { described_class }

  # Members can make late plates, update them, and list them
  permissions :create?, :index? do
    it 'denies access if user is not a member' do
      expect(subject).not_to permit(user)
    end

    it 'allows if user is a member' do
      expect(subject).to permit(member)
    end
  end

  # Org mans, and kitchen mans can delete plates. Members can delete their own plates
  permissions :destroy?, :edit? do
    it 'denies if they are not a org man or kitchen man' do
      expect(subject).not_to permit(user)
    end

    it 'denies if the plate is not theirs' do
      expect(subject).not_to permit(user, member)
    end

    it 'allows if they are an org man or kitchen man' do
      expect(subject).to permit(org_man, kit_man)
    end

    it 'allows if the plate is their own' do
      expect(subject).to permit(user, user)
    end
  end
end
