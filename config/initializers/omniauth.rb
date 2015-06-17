Rails.application.config.middleware.use OmniAuth::Builder do
       provider :developer unless Rails.env.production?
       provider :facebook, ENV["facebook_client_id"], ENV["facebook_secret"]
       # Adds support for linkedin with key
       provider :linkedin, ENV['linkedin_client_id'], ENV['linkedin_secret'],
       	scope: 'r_basicprofile',
  		fields: ['id', 'first-name', 'last-name', 'location', 'picture-url', 'public-profile-url']

  		OmniAuth.config.on_failure = Proc.new do |env|
		  SessionsController.action(:auth_failure).call(env)
		end
end