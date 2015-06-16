require 'rails_helper'

RSpec.describe "subcategories/index", type: :view do
  before(:each) do
    assign(:subcategories, [
      Subcategory.create!(
        :name => "Name",
        :category => ""
      ),
      Subcategory.create!(
        :name => "Name",
        :category => ""
      )
    ])
  end

  it "renders a list of subcategories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
