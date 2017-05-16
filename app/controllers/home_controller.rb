class HomeController < ApplicationController
  def logged_in
    skip_authorization

    unless current_user
      redirect_to authenticate_path
    end

    # Grabs late plates
    @late_plates = LatePlate.where(user_id: current_user.id).where(organization_id: current_user.affiliated_organization).limit(3)

    # Grabs announcements
    @announcements = policy_scope(Announcement).where(organization_id: current_user&.affiliated_organization).limit(5).order(id: :desc)

    # Grabs maintenance requests
    @maintenance_requests = policy_scope(MaintenanceRequest).where(organization_id: current_user&.affiliated_organization).limit(3).order(priority_id: :desc)
  end

  def logged_out
    skip_authorization
  end
end
