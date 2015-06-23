require 'rails_helper'

RSpec.describe Category, type: :model do

it "Creates a new category" do
	category = Category.new(name: "abc")
	expect(category).to be_valid
end

it "Prevents a new category from being made if name is not entered" do
	category = Category.new(name: "Andre")
	expect(category).to be_valid
end

it "Reqiores a new category to be unique" do
	category = Category.new(name: nil)
	expect(category).to be_invalid
end



end