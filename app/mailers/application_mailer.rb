class ApplicationMailer < ActionMailer::Base
  default from: 'will.housemanager@gmail.com',
          reply_to: 'no-reply@housemanager.me'
  layout 'mailer'
end
