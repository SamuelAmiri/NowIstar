Rails.application.config.middleware.use OmniAuth::Builder do
       provider :developer unless Rails.env.production?
       provider :facebook, ENV["facebook_client_id"], ENV["facebook_secret"],
       	scope: 'public_profile', 
       	info_fields: 'id,first_name,last_name, email, image'
       	# Adds support for linkedin with key
       provider :linkedin, ENV['linkedin_client_id'], ENV['linkedin_secret'],
        scope:  [ 'r_basicprofile', 'r_emailaddress'],
  		  fields: ['id', 'first-name', 'last-name', 'picture-url', 'email-address']

  		OmniAuth.config.on_failure = Proc.new do |env|
		  SessionsController.action(:auth_failure).call(env)
		end
end