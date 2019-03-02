class AddServerPermissionToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :server_permission, :bool, null: false, default: false
  end
end
