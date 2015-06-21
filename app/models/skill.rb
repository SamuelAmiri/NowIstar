class Skill < ActiveRecord::Base
	require "json"
	belongs_to :user
	belongs_to :subcategory
	geocoded_by :full_address
	after_validation :geocode

	def full_address
		[address, city, state, zipcode].join(', ')
	end

end
