class Organization < ApplicationRecord
  has_one :user, foreign_key: 'organization_manager'

  def manager_name
    if self.organization_manager
      User.find(self.organization_manager).full_name
    else
      "Needs an Org Manager"
    end
  end

  def provisional_members
    users = []
    users.concat(get_provisional_members(self))
  end

  def chapter_school
    "#{abbreviation} at #{school}"
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
end
