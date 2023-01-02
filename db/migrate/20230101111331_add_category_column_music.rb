class AddCategoryColumnMusic < ActiveRecord::Migration[6.1]
  def change
    add_column :musics, :category_id, :integer
  end
end
