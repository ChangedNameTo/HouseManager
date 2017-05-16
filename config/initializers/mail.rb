  ActionMailer::Base.smtp_settings = {
    :address => "smtp.mailgun.org",
    :port => 587,
    :user_name => 'postmaster@housemanager.me.mailgun.org', #Your SMTP user
    :password => 'a85a6ceee60ed1b67f579bf67bc6d7', #Your SMTP password
    :authentication => :plain,
    :domain => 'housemanager.me.mailgun.org'
  }

  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.default charset: "utf-8"