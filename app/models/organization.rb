# == Schema Information
#
# Table name: organizations
#
#  id                   :integer          not null, primary key
#  full_name            :string           not null
#  abbreviation         :string           not null
#  school               :string           not null
#  address              :string           not null
#  organization_manager :integer
#  user_manager         :integer
#  kitchen_manager      :integer
#  house_manager        :integer
#  service_manager      :integer
#  scholarship_manager  :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Organization < ApplicationRecord
  # Helps our triggers
  include ActiveModel::Dirty

  has_one :user, foreign_key: 'organization_manager'

  def manager_name
    if self.organization_manager
      User.find(self.organization_manager).full_name
    else
      "Needs an Org Manager"
    end
  end

  def chapter_school
    "#{abbreviation} at #{school}"
  end

  def provisional_members
    users = []
    users.concat(get_provisional_members(self))
  end

  def get_provisional_members(user)
    members = []
    User.where(affiliated_organization: self.id).where.not(affiliated_organization: nil).where(enabled: false).each do |member|
      members.append(member)
    end

    members
  end

  def organization_members
    users = []
    users.concat(get_organization_members(self))
  end

  def get_organization_members(user)
    members = []
    User.where(affiliated_organization: self.id).where.not(affiliated_organization: nil).where(enabled: true).each do |member|
      members.append(member)
    end

    members
  end

  # Creates db triggers that are super helpful
  before_update :delete_organization_manager, :if => :organization_manager_changed?
  before_update :delete_user_manager, :if => :user_manager_changed?
  before_update :delete_kitchen_manager, :if => :kitchen_manager_changed?
  before_update :delete_house_manager, :if => :house_manager_changed?
  before_update :delete_service_manager, :if => :service_manager_changed?
  before_update :delete_scholarship_manager, :if => :scholarship_manager_changed?

  after_update :add_organization_manager, :if => :organization_manager_changed?
  after_update :add_kitchen_manager, :if => :kitchen_manager_changed?
  after_update :add_user_manager, :if => :user_manager_changed?
  after_update :add_house_manager, :if => :house_manager_changed?
  after_update :add_service_manager, :if => :service_manager_changed?
  after_update :add_scholarship_manager, :if => :scholarship_manager_changed?

  private

  # Functions that delete no longer valid roles
  def delete_organization_manager
    UserRole.where(user_id: self.organization_manager_was).where(role_id: 2).destroy_all
  end

  def delete_user_manager
    UserRole.where(:user_id => self.user_manager_was).where(:role_id => 3).delete_all
  end

  def delete_kitchen_manager
    UserRole.where(user_id: self.kitchen_manager_was).where(role_id: 4).destroy_all
  end

  def delete_service_manager
    UserRole.where(user_id: self.service_manager_was).where(role_id: 5).destroy_all
  end

  def delete_scholarship_manager
    UserRole.where(user_id: self.scholarship_manager_was).where(role_id: 6).destroy_all
  end

  def delete_house_manager
    UserRole.where(user_id: self.house_manager_was).where(role_id: 7).destroy_all
  end


  def add_organization_manager
    UserRole.create(:user_id => self.organization_manager, :role_id => 2)
  end

  def add_user_manager
    UserRole.create(:user_id => self.user_manager, :role_id => 3)
  end

  def add_kitchen_manager
    UserRole.create(:user_id => self.kitchen_manager, :role_id => 4)
  end

  def add_service_manager
    UserRole.create(:user_id => self.service_manager, :role_id => 5)
  end

  def add_scholarship_manager
    UserRole.create(:user_id => self.scholarship_manager, :role_id => 6)
  end

  def add_house_manager
    UserRole.create(:user_id => self.house_manager, :role_id => 7)
  end
end
