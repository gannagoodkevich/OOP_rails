class ApplicationMailer < ActionMailer::Base
  default from: 'somemail@mail.com'
  layout 'mailer'
end
