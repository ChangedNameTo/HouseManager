class CreateUserRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_roles do |t|
      t.references :user, null: false
      t.references :role, null: false

      t.timestamps
    end

    add_index :user_roles, [:user_id, :role_id], unique: true
    add_foreign_key :user_roles, :roles, name: 'fk_user_role_role'
    add_foreign_key :user_roles, :users, name: 'fk_user_role_user'
  end
end
