SMTP_SETTINGS = {
  address: ENV.fetch("MAILGUN_SMTP_SERVER"),
  authentication: :plain,
  domain: ENV.fetch("MAILGUN_DOMAIN"),
  enable_starttls_auto: true,
  password: ENV.fetch("MAILGUN_SMTP_PASSWORD"),
  port: ENV.fetch("MAILGUN_SMTP_PORT"),
  user_name: ENV.fetch("MAILGUN_SMTP_LOGIN")
}