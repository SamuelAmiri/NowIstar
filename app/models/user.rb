class User < ActiveRecord::Base
	has_secure_password
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  	validates :password, presence: true, confirmation: true, length: { in: 6..20 }
  	validates :fname, presence: true
  	validates :lname, presence: true
end
