class User < ActiveRecord::Base
	ratyrate_rater
	has_many :skills, dependent: :destroy
	has_many :sales, class_name: "Order", foreign_key: "seller_id"
  	has_many :purchases, class_name: "Order", foreign_key: "buyer_id"
  	
  	
  	accepts_nested_attributes_for :skills
	#has_attached_file :image, styles: {small: "50x50", med: "100x100", large: "200x200" }, :default_url => ""
	#validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	class << self
	  def from_omniauth(auth_hash)
	    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
	    user.fname = auth_hash['info']['first_name']
	    user.lname = auth_hash['info']['last_name']
	    user.image = auth_hash['info']['image']
	    user.email = auth_hash['info']['email']
	    user.save!
	    user
	  end
	end
end
