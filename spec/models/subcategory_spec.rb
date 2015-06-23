require 'rails_helper'

RSpec.describe Subcategory, type: :model do
	before do
  		@subcategory = Factory(:subcategory)
	end
	  it "Creates a new subcategory" do
	    subcategory = Subcategory.new(name: "Xyz Abc", category_id: 1)
	    expect(subcategory).to be_valid
	  end 
	  it "Prevents subcategory from being made if name is not entered" do
	    subcategory = Subcategory.new(name: nil, category_id: 1)
	    expect(subcategory).to be_invalid
	  end
	  it "Requires subategory name to be unique" do
	  	subcategory = Subcategory.new(name: "Dance", category_id: 1)
	  	expect(subcategory).to be_invalid
	  end

end
