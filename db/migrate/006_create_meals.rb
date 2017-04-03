class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string :name, null: false
      t.time :time, null: false
      t.integer :organization_id, null: false

      t.timestamps
    end

    add_index :meals, :name, unique: true

    add_foreign_key :meals, :organizations, column: "organization_id", name: 'fk_meals_organization_id'
  end
end
