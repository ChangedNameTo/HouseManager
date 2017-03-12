class AddOrganizationsToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.references :organization, index: true
    end

    add_foreign_key :users, :organizations
  end
end
