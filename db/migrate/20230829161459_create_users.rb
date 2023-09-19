class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email, null: false, default: "" 
      t.string :encrypted_password, null: false, default: "" 
      t.text :bio
      t.text :favorite_food
      t.text :recently_visited_places

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
