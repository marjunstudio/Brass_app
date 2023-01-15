class CreateLikesMusics < ActiveRecord::Migration[6.1]
  def change
    create_table :likes_musics do |t|
      t.references :user, null: false, foreign_key: true
      t.references :music, null: false, foreign_key: true

      t.timestamps
    end
  end
end
