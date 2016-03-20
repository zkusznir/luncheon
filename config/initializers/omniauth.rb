Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,
           Rails.application.secrets.fb_key,
           Rails.application.secrets.fb_secret
end
