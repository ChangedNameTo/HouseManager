class HomeController < ApplicationController
  def logged_in
    skip_authorization

    unless current_user
      redirect_to authenticate_path
    end

    # Grabs late plates
    sql = "SELECT *
             FROM late_plates
            WHERE meal_id
               IN (SELECT id
                     FROM meals
                    WHERE time > LOCALTIME
                 ORDER BY abs(extract(epoch from LOCALTIME - time))
                    LIMIT 1);"
    @late_plates = LatePlate.find_by_sql(sql)

    # Grabs announcements
    @announcements = policy_scope(Announcement).where(organization_id: current_user&.affiliated_organization).limit(5).order(id: :desc)
  end

  def logged_out
    skip_authorization
  end
end