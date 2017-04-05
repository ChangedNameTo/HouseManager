class CreateLatePlates < ActiveRecord::Migration[5.0]
  def change
    create_table :late_plates do |t|
      t.date :day, null: false
      t.boolean :completed, default: false, null: false
      t.integer :meal_id, null: false
      t.integer :user_id, null: false
      t.integer :organization_id, null: false
      t.timestamps
    end

    add_index :late_plates, :day
    add_index :late_plates, :meal_id

    add_foreign_key :late_plates, :meals, column: "meal_id", name: 'fk_late_plate_meal'
    add_foreign_key :late_plates, :users, column: "user_id", name: 'fk_late_plate_requester'
    add_foreign_key :late_plates, :organizations, column: "organization_id", name: 'fk_late_plate_organization_id'
  end
end
