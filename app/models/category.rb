class Category < ActiveRecord::Base
	has_many :subcategories
	validates :name, presence: true
end
