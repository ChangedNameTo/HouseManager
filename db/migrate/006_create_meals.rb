class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :meals, :name, unique: true

    meals = [
      {
        name: "Breakfast"
      },
      {
        name: "Lunch"
      },
      {
        name: "Dinner"
      }
    ]

    meals.each do |meal|
      Meal.find_or_create_by!(meal)
    end
  end
end
