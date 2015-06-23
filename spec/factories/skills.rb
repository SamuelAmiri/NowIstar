FactoryGirl.define do
  factory :skill do
    user 1
	subcategory 1
	price "19.99"
	description "This is a description of a skill."
	image "MyText"
	title "MyString"
	address "1530 2nd Street"
	city "Santa Monica"
	zipcode "90404"
	state "CA"
	latitude "34.012959"
	longitude "-118.494992"
  end

end
