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

require 'rails_helper'
require Rails.root.join('spec', 'models', 'shared_examples', 'non_null_field.rb')

describe User do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  describe 'provider', field: :provider do
    it_behaves_like 'non null field'
  end

  describe 'UID', field: :uid do
    it_behaves_like 'non null field'

    it "not valid wihout a unique UID per provider" do
      first_user = create(:user, provider: "Test", uid: "test")
      expect(build(:user, uid: "test", provider: "Test")).not_to be_valid
    end

    it "is valid without a unique UID between multiple providers" do
      first_user = create(:user, provider: "Test", uid: "test")
      expect(build(:user, uid: "test", provider: "Best")).to be_valid
    end
  end

    describe 'first name', field: :first_name do
    it_behaves_like 'non null field'
  end

  describe 'last name', field: :last_name do
    it_behaves_like 'non null field'
  end

	describe 'oauth expiration date', field: :oauth_expires_at do
    it_behaves_like 'non null field'
  end

	describe 'email_address', field: :email_address do
    it_behaves_like 'non null field'

    it "is invalid without an email" do
      expect(build(:user, email_address: nil )).not_to be_valid
    end
  end

	describe "#has_role?" do
    before :each do
      @user = create(:user)
    end

    it "returns true if the user has a role and one is passed in" do
      UserRole.create(
        user: @user,
        role: Role.find_by(label: 'Organization Manager')
      )

      expect(@user.has_role?(Role.where(label: 'Organization Manager'))).to eq true
    end

    it "returns true if the user has a role and multiple are passed in" do
      UserRole.create(
        user: @user,
        role: Role.find_by(label: ['Organization Manager', 'Kitchen Manager'])
      )

      expect(@user.has_role?(Role.where(label: ['Organization Manager', 'Kitchen Manager']))).to eq true
    end

    it "returns true if the user has a role that is passed in, and one that is not" do
      UserRole.create(
        user: @user,
        role: Role.find_by(label: 'Organization Manager')
      )

      UserRole.create(
        user: @user,
        role: Role.find_by(label: 'Service Manager')
      )

      expect(@user.has_role?(Role.where(label: ['Organization Manager', 'Kitchen Manager']))).to eq true
    end

    it "returns false if the user has no roles" do
      expect(@user.has_role?(Role.where(label: 'Organization Manager'))).to eq false
    end

    it "returns false if the user has no roles that were passed in" do
      UserRole.create(
        user: @user,
        role: Role.find_by(label: 'Organization Manager')
      )

      expect(@user.has_role?(Role.where(label: 'Kitchen Manager'))).to eq false
    end
  end

  describe "#full_name" do
    it "returns the user's full name as a string" do
      user = build(:user,
        first_name: "Will",
        last_name: "Mitchell"
      )

      expect(user.full_name).to eq "Will Mitchell"
    end
  end

  describe "#is_member?" do
    before :each do
      @user = create(:user)
      @organization = create(:organization)
    end

    it "returns true if the user is in the organization" do
      @user.affiliated_organization = @organization.id
      @user.enabled = true

      expect(@user.is_member?(@organization)).to eq true
    end

    it "returns false if the user is affiliated but not enabled in the organization" do
      @user.affiliated_organization = @organization.id
      @user.enabled = false

      expect(@user.is_member?(@organization)).to eq false
    end

    it "returns false if the user in no way connected to the organization" do
      @user.affiliated_organization = nil
      @user.enabled = false

      expect(@user.is_member?(@organization)).to eq false
    end
  end

end
