require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      task_title: "MyString",
      task_details: "MyString",
      frequency: "MyString"
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input[name=?]", "task[task_title]"

      assert_select "input[name=?]", "task[task_details]"

      assert_select "input[name=?]", "task[frequency]"
    end
  end
end
