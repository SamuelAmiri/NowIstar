require 'rails_helper'

RSpec.describe "subcategories/new", type: :view do
  before(:each) do
    assign(:subcategory, Subcategory.new(
      :name => "MyString",
      :category => ""
    ))
  end

  it "renders new subcategory form" do
    render

    assert_select "form[action=?][method=?]", subcategories_path, "post" do

      assert_select "input#subcategory_name[name=?]", "subcategory[name]"

      assert_select "input#subcategory_category[name=?]", "subcategory[category]"
    end
  end
end
