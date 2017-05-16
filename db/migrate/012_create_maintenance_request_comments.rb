class CreateMaintenanceRequestComments < ActiveRecord::Migration[5.0]
  def change
    create_table :maintenance_request_comments do |t|
      t.integer :maintenance_request_id, null: false
      t.string :body, null: false
      t.integer :author_id, null: false

      t.timestamps
    end

    add_foreign_key :maintenance_request_comments, :maintenance_requests, column:"maintenance_request_id", name: 'fk_request_comments'
    add_foreign_key :maintenance_request_comments, :users, column:"author_id", name: 'fk_request_comment_author'
  end
end
