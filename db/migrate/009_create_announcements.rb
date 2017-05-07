class CreateAnnouncements < ActiveRecord::Migration[5.0]
  def change
    create_table :announcements do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :author_id, null: false
      t.integer :organization_id, null: false

      t.timestamps
    end

    add_foreign_key :announcements, :users, column:"author_id", name: 'fk_announcement_author'
    add_foreign_key :announcements, :organizations, column:"organization_id", name: 'fk_announcement_organization'
  end
end

