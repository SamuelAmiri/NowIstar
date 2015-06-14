Rails.application.config.middleware.use OmniAuth::Builder do
       provider :developer unless Rails.env.production?
       provider :facebook, ENV["facebook_client_id"], ENV["facebook_secret"]
end