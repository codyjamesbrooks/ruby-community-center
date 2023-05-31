class AddSuperadminToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :superadmin, :boolean, null: false, default: false
  end
end
