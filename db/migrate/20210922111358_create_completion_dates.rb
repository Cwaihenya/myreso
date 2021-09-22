class CreateCompletionDates < ActiveRecord::Migration[5.2]
  def change
    create_table :completion_dates do |t|
      t.integer :task_id
      t.date :date

      t.timestamps
    end
  end
end
