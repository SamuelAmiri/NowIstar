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

it "Reqiures a new category to be unique" do
	category = Category.create(name: "Beauty")
	category2 = Category.create(name: "Beauty")
	expect(category2).to be_invalid
end

end