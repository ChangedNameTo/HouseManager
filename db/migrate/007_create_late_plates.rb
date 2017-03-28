class CreateLatePlates < ActiveRecord::Migration[5.0]
  def change
    create_table :late_plates do |t|
      t.date :day, null: false
      t.boolean :completed, default: false, null: false
      t.integer :meal, null: false
      t.integer :requester, null: false
      t.integer :organization, null: false
      t.timestamps
    end

    add_index :late_plates, :day

    add_foreign_key :late_plates, :meals, column: "meal", name: 'fk_late_plate_meal'
    add_foreign_key :late_plates, :users, column: "requester", name: 'fk_late_plate_requester'
    add_foreign_key :late_plates, :organizations, column: "organization", name: 'fk_late_plate_organization'
  end
end