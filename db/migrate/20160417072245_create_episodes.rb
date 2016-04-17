class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.string :name
      t.date :release_date
      t.integer :season
      t.integer :episode_number
      t.text :overview
      t.float :rating

      t.references :series
      t.timestamps
    end
  end
end
