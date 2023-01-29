class AddColumnToMusics < ActiveRecord::Migration[6.1]
  def change
    add_column :musics, :description, :string
    add_reference :musics, :composer, foreign_key: true
  end
end
