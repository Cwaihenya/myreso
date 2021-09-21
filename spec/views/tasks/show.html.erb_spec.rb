require 'rails_helper'

RSpec.describe "tasks/show", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      task_title: "Task Title",
      task_details: "Task Details",
      frequency: "Frequency"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Task Title/)
    expect(rendered).to match(/Task Details/)
    expect(rendered).to match(/Frequency/)
  end
end
