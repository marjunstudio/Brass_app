class CreateMusics < ActiveRecord::Migration[6.1]
  def change
    create_table :musics do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
