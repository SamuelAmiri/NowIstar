class User < ActiveRecord::Base
	has_secure_password
	has_attached_file :image, styles: {small: "50x50", med: "100x100", large: "200x200" }, :default_url => ""
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  	validates :password, presence: true, confirmation: true, length: { in: 6..20 }
  	validates :fname, presence: true
  	validates :lname, presence: true
end
