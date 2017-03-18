class Organization < ApplicationRecord
  has_one :user, foreign_key: 'organization_manager'

  def manager_name
    if self.organization_manager
      User.find(self.organization_manager).full_name
    else
      "Needs an Org Manager"
    end
  end

  def organization_members
    users = []
    users.concat(get_organization_members(self))
  end

  def get_organization_members(user)
    members = []
    User.where(organization_id: self.id).where.not(organization_id: nil).each do |member|
      members.append(member)
    end

    members
  end
end
