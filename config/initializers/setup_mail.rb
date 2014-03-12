ActionMailer::Base.smtp_settings = {
  :authentication       => "plain",
  :enable_starttls_auto => true,
  :openssl_verify_mode  => 'none'
}