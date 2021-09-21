require 'rails_helper'

RSpec.describe "resolutions/new", type: :view do
  before(:each) do
    assign(:resolution, Resolution.new(
      title: "MyString",
      details: "MyString"
    ))
  end

  it "renders new resolution form" do
    render

    assert_select "form[action=?][method=?]", resolutions_path, "post" do

      assert_select "input[name=?]", "resolution[title]"

      assert_select "input[name=?]", "resolution[details]"
    end
  end
end
