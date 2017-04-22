class UserEnhancements < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :image
      t.integer :number, index: true
      t.integer :big
    end
  end
end
