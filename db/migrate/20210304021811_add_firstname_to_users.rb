class AddFirstnameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :firstname, :string
  end
end
