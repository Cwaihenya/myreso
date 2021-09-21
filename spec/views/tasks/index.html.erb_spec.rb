require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        task_title: "Task Title",
        task_details: "Task Details",
        frequency: "Frequency"
      ),
      Task.create!(
        task_title: "Task Title",
        task_details: "Task Details",
        frequency: "Frequency"
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", text: "Task Title".to_s, count: 2
    assert_select "tr>td", text: "Task Details".to_s, count: 2
    assert_select "tr>td", text: "Frequency".to_s, count: 2
  end
end
