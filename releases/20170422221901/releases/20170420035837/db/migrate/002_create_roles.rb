class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :label, null: false
      t.string :description, null: false

      t.timestamps
    end

    add_index :roles, :label, unique: true
  end
end
