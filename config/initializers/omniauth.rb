# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook,
  #          ENV.fetch('FACEBOOK_API_APP_ID'),
  #          ENV.fetch('FACEBOOK_API_APP_SECRET'),
  #          scope: 'email,public_profile'
end
