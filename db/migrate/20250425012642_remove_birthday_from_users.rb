class RemoveBirthdayFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :birthday, :date
  end
end
