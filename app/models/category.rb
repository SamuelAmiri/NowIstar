class Category < ActiveRecord::Base
	has_many :subcategories
	validates :name, presence: true, uniqueness: {case_sensitive: false}
end
