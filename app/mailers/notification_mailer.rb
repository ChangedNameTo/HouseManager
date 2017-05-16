class NotificationMailer < ApplicationMailer
  default from: 'notifications@housemanager.me'

  def welcome_email(user_id)
    @user = User.find(user_id)

    mail(
      to: @user.email_address,
      subject: "Welcome to House Manager #{@user.full_name}!"
    )
  end

  def new_announcement_email(recipients, announcement_id)
    @announcement = Announcement.find(announcement_id)
    @author = User.find(@announcement.author_id)

    mail(
      to: recipients,
      subject: "New Annoucement by #{@author.full_name} - #{@announcement.title}"
    )
  end

  def new_maintenance_request_email(recipients, request_id)
    @request = MaintenanceRequest.find(request_id)
    @reporter = User.find(@request.reporter)

    mail(
      to: recipients,
      subject: "New Maintenance Request by #{@reporter.full_name} - #{@request.issue_title}"
    )
  end
end
