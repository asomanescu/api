class CreateSeries < ActiveRecord::Migration[5.0]
  def change
    create_table :series do |t|
      t.string :name
      t.float :rating
      t.string :status
      t.datetime :first_aired
      t.string :fan_art
      t.text :overview
      t.string :genre
      t.string :banner
      t.string :imdb_id

      t.timestamps null: false
    end
  end
end
