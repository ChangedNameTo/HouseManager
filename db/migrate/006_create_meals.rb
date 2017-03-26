class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string :name, null: false
      t.time :time, null: false

      t.timestamps
    end

    add_index :meals, :name, unique: true

    meals = [
      {
        name: "Breakfast",
        time: '7:00 AM'
      },
      {
        name: "Lunch",
        time: '11:00 AM'
      },
      {
        name: "Dinner",
        time: '5:30 PM'
      }
    ]

    meals.each do |meal|
      Meal.find_or_create_by!(meal)
    end
  end
end
