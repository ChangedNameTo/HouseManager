class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :full_name, null: false
      t.string :abbreviation, null: false
      t.string :school, null: false
      t.string :address, null: false
      t.integer :organization_manager

      t.timestamps
    end

    add_index :organizations, :full_name, unique: true
    add_foreign_key :organizations, :users, column:"organization_manager", name: 'fk_organization_manager'

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
