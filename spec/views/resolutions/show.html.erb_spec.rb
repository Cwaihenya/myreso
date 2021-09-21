require 'rails_helper'

RSpec.describe "resolutions/show", type: :view do
  before(:each) do
    @resolution = assign(:resolution, Resolution.create!(
      title: "Title",
      details: "Details"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Details/)
  end
end
