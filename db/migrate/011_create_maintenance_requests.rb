class CreateMaintenanceRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :maintenance_requests do |t|
        t.string :issue_title, null: false
        t.string :description, null: false
        t.integer :reporter_id, null: false
        t.integer :organization_id, null: false
        t.integer :priority_id, null: false
        t.boolean :started, default: false
        t.boolean :finished, default: false

        t.timestamps
      end

      add_foreign_key :maintenance_requests, :users, column:"reporter_id", name: 'fk_request_reporter'
      add_foreign_key :maintenance_requests, :organizations, column:"organization_id", name: 'fk_request_organization'
      add_foreign_key :maintenance_requests, :maintenance_request_priorities, column:"priority_id", name: 'fk_request_priority'
  end
end

