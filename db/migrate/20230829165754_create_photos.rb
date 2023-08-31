class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.string :image_url
      t.text :caption
      t.references :user, null: false, foreign_key: true
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
