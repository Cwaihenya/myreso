class AddColumnsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :days_completed, :integer, default: 0

end
  end
