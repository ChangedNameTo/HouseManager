  ActionMailer::Base.smtp_settings = {
    :address => "...",
    :port => 587,
    :user_name => ENV["SES_SMTP_USERNAME"], #Your SMTP user
    :password => ENV["SES_SMTP_PASSWORD"], #Your SMTP password
    :authentication => :login,
    :enable_starttls_auto => true
  }

  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.default charset: "utf-8",
    from: "will.housemanager@gmail.com"
