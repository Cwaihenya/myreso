require 'rails_helper'

RSpec.describe "resolutions/index", type: :view do
  before(:each) do
    assign(:resolutions, [
      Resolution.create!(
        title: "Title",
        details: "Details"
      ),
      Resolution.create!(
        title: "Title",
        details: "Details"
      )
    ])
  end

  it "renders a list of resolutions" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Details".to_s, count: 2
  end
end
