class Order < ActiveRecord::Base
	ratyrate_rateable "rating"
	has_many :reviews
  belongs_to :skill
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
  
end
