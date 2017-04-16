class HomeController < ApplicationController
  def logged_in
    skip_authorization

    unless current_user
      redirect_to authenticate_path
    end

    @late_plates = policy_scope(LatePlate).where(organization_id: current_user.affiliated_organization)

    sql = "SELECT *
             FROM late_plates
            WHERE meal_id
               IN (SELECT id
                     FROM meals
                    WHERE time > LOCALTIME
                 ORDER BY abs(extract(epoch from LOCALTIME - time))
                    LIMIT 1);"
  end

  def logged_out
    skip_authorization
  end
end
