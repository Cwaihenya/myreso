class RemoveNicknameIndexOnUsers < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, column: :nickname, unique: true
  end
end
