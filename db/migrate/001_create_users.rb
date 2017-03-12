class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number, null: false
      t.string :email_address, null: false, unique: true

      t.timestamps
    end

    users = [
      {
        first_name: "Will", 
        last_name: "Mitchell", 
        phone_number: "334-430-7459", 
        email_address: "william.m95@gmail.com", 
      }

    ]

    users.each do |user|
      User.find_or_create_by!(user)
    end
  end
end
