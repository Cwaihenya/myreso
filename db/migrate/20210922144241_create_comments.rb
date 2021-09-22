class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :blog
      t.string :references
      t.string :content
      t.string :text

      t.timestamps
    end
  end
end
