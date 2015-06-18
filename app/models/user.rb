class User < ActiveRecord::Base
	has_many :skills
	#has_attached_file :image, styles: {small: "50x50", med: "100x100", large: "200x200" }, :default_url => ""
	#validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def full_address
	 	street_address.to_s + ", " + city.to_s + ", " + state.to_s + ", " + zipcode.to_s
	end

	def filled
		fname != nil
		lname != nil
		phonenumber != nil
		street_address != nil
		city != nil
	end

	class << self
	  def from_omniauth(auth_hash)
	    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
	    puts "**********************************************"
	    puts auth_hash['info']['image']
	    puts "**********************************************"
	    user.fname = auth_hash['info']['first_name']
	    user.lname = auth_hash['info']['last_name']
	    user.image = auth_hash['info']['image']
	    user.email = auth_hash['info']['email']
	    user.save!
	    user
	  end
	end
end
