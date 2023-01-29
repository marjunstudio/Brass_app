class CreateComposers < ActiveRecord::Migration[6.1]
  def change
    create_table :composers do |t|
      t.string :composer

      t.timestamps
    end
  end
end
