SealedEnvelope::Application.configure do
  user, pass = String(ENV['MANDRILL_AUTH']).split(':')
  user and config.action_mailer.smtp_settings = {
      :address              => "smtp.mandrillapp.com",
      :port                 => 587,
      :user_name            => user,
      :password             => pass,
      :authentication       => 'login',
      :domain               => 'sealed-envelope.f1techware.co.nz',
      :enable_starttls_auto => true,
    }
end
