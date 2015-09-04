class SealMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.seal_mailer.opening_email.subject
  #
  def opening_email(seal)
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
