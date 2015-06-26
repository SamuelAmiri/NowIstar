class Order < ActiveRecord::Base
  belongs_to :skill
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
  ratyrate_rateable "rating"
end
