class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :text
      t.string :img
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
