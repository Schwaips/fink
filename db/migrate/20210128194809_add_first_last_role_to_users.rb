class AddFirstLastRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :string, default: "student"
    add_column :users, :slack_workspace_uid, :string
  end
end
