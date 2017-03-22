class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :full_name, null: false
      t.string :abbreviation, null: false
      t.string :school, null: false
      t.string :address, null: false
      t.integer :organization_manager
      t.integer :user_manager
      t.integer :kitchen_manager
      t.integer :house_manager
      t.integer :service_manager
      t.integer :scholarship_manager

      t.timestamps
    end

    add_index :organizations, :full_name, unique: true
    add_foreign_key :organizations, :users, column:"organization_manager", name: 'fk_organization_manager'
    add_foreign_key :organizations, :users, column:"user_manager", name: 'fk_user_manager'
    add_foreign_key :organizations, :users, column:"kitchen_manager", name: 'fk_kitchen_manager'
    add_foreign_key :organizations, :users, column:"house_manager", name: 'fk_house_manager'
    add_foreign_key :organizations, :users, column:"service_manager", name: 'fk_service_manager'
    add_foreign_key :organizations, :users, column:"scholarship_manager", name: 'fk_scholarship_manager'

    organizations = [
      {
        full_name: "Phi Sigma Kappa",
        abbreviation: "PSK",
        school: "Georgia Tech",
        address: "825 Techwood Drive NW"
      }

    ]

    organizations.each do |organization|
      Organization.find_or_create_by!(organization)
    end
  end
end
