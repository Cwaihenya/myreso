require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      task_title: "MyString",
      task_details: "MyString",
      frequency: "MyString"
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input[name=?]", "task[task_title]"

      assert_select "input[name=?]", "task[task_details]"

      assert_select "input[name=?]", "task[frequency]"
    end
  end
end
