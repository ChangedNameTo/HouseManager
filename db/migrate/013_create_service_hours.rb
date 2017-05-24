class CreateServiceHours < ActiveRecord::Migration[5.0]
  def change
    create_table :service_hours do |t|
      t.string :title, null: false
      t.string :for, null: false
      t.string :description, null: false
      t.date :day, null: false
      t.decimal :hours, default: nil
      t.decimal :money, default: nil
      t.integer :recipient_id, null: false

      t.timestamps
    end

    add_foreign_key :service_hours, :users, column:"recipient_id", name: 'fk_service_hour_recipient'
  end
end
