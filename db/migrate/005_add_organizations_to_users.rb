class AddOrganizationsToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.integer :affiliated_organization, index: true
    end

    add_foreign_key :users, :organizations, column:"affiliated_organization", name: 'fk_affiliated_organization'
  end
end
