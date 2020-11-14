class AddUserIdsToSuggestion < ActiveRecord::Migration[6.0]
  def change
    add_column :suggestions, :user_id, :integer
    add_column :suggestions, :task_id, :integer
  end
end
