class SealMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.seal_mailer.opening_email.subject
  #
  def opening_email(seal)
    subject = default_i18n_subject({
      seal_name: seal.name,
      envelope_name: seal.envelope_name,
    })
    mail to: seal.notification_email, subject: subject
  end
end
