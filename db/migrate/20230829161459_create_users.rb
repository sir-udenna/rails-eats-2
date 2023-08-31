class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.text :bio
      t.text :favorite_food
      t.text :recently_visited_places

      t.timestamps
    end
  end
end
