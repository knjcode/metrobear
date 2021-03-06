Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,
    Rails.application.secrets.twitter_api_key,
    Rails.application.secrets.twitter_api_secret
  provider :facebook,
    Rails.application.secrets.facebook_api_key,
    Rails.application.secrets.facebook_api_secret,
    :image_size => 'square',
    :secure_image_url => 'true'
  provider :github,
    Rails.application.secrets.github_api_key,
    Rails.application.secrets.github_api_secret
  provider :google_oauth2,
    Rails.application.secrets.google_api_key,
    Rails.application.secrets.google_api_secret,
    :image_aspect_ration => 'square'
end
