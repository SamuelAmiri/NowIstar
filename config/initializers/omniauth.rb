Rails.application.config.middleware.use OmniAuth::Builder do
       provider :developer unless Rails.env.production?
       provider :facebook, ENV["facebook_client_id"], ENV["facebook_secret"]
       # Adds support for linkedin with key
       provider :linkedin, ENV['linkedin_client_id'], ENV['linkedin_secret']
end