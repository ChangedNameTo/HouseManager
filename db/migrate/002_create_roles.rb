class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :label, null: false
      t.string :description, null: false

      t.timestamps
    end

    add_index :roles, :label, unique: true

    roles = [
      {
        label: "System Admin", 
        description: "Super user, given only to people who can manage the entire system (Will and Michael)."
      }, 

      {
        label: "Organization Admin", 
        description: "Chapter admin, usually president, can do everything but see other organizations and manage system level operations."
      }, 

      {
        label: "User Admin", 
        description: "Manages user lists for an organization."
      }, 

      {
        label: "Member", 
        description: "Normal user."
      }

    ]

    roles.each do |role|
      Role.find_or_create_by!(role)
    end
  end
end
