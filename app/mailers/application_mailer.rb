class ApplicationMailer < ActionMailer::Base
  default from: 'House Manager will@housemanager.me',
          reply_to: 'no-reply@housemanager.me'
  layout 'mailer'
end
