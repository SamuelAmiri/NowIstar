class Order < ActiveRecord::Base
	ratyrate_rateable "rating"
  belongs_to :skill
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
  
end
