class User < ActiveRecord::Base
	has_many :skills
	has_secure_password
	has_attached_file :image, styles: {small: "50x50", med: "100x100", large: "200x200" }, :default_url => ""
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	# validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
 #  	validates :password, presence: true, confirmation: true, length: { in: 6..20 }
 #  	validates :fname, presence: true
 #  	validates :lname, presence: true

	class << self
	  def from_omniauth(auth_hash)
	    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
	    user.fname = auth_hash['info']['first_name']
	    user.lname = auth_hash['info']['last_name']
	    user.image = auth_hash['info']['image']
	    user.save!
	    user
	  end
	 
	  # private
	 
	  # def get_social_location_for(provider, location_hash)
	  #   case provider
	  #     when 'linkedin'
	  #       location_hash['name']
	  #     else
	  #       location_hash
	  #   end
	  # end
	 
	  # def get_social_url_for(provider, urls_hash)
	  #   case provider
	  #     when 'linkedin'
	  #       urls_hash['public_profile']
	  #     else
	  #       urls_hash[provider.capitalize]
	  #   end
	  # end
	end

end
