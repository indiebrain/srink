Clearance.configure do |config|
  config.mailer_sender = "reply@example.com"
  config.redirect_url = '/links'
  config.rotate_csrf_on_sign_in = true
end
