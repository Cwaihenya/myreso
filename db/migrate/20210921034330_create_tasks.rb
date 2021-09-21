class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task_title
      t.string :task_details
      t.string :frequency

      t.timestamps
    end
  end
end
