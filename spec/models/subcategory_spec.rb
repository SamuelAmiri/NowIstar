require 'rails_helper'

RSpec.describe Subcategory, type: :model do


	  it "Creates a new subcategory" do
	    subcategory = Subcategory.new(name: "Xyz Abc", category_id: 1)
	    expect(subcategory).to be_valid
	  end 
	  it "Prevents subcategory from being made if name is not entered" do
	    subcategory = Subcategory.new(name: nil, category_id: 1)
	    expect(subcategory).to be_invalid
	  end

	  it "Requires subategory name to be unique" do
	  	category = Category.create(name: "Art & Creative")
	  	subcategory1 = Subcategory.create(name: "Dance", category_id: category.id)
	  	subcategory2 = Subcategory.create(name: "Dance", category_id: category.id)
	  	expect(subcategory1).to be_valid
	  	expect(subcategory2).to be_invalid
	  end

end
