require 'rails_helper'

RSpec.describe "subcategories/edit", type: :view do
  before(:each) do
    @subcategory = assign(:subcategory, Subcategory.create!(
      :name => "MyString",
      :category => ""
    ))
  end

  it "renders the edit subcategory form" do
    render

    assert_select "form[action=?][method=?]", subcategory_path(@subcategory), "post" do

      assert_select "input#subcategory_name[name=?]", "subcategory[name]"

      assert_select "input#subcategory_category[name=?]", "subcategory[category]"
    end
  end
end
