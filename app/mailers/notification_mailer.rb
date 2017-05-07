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
end
