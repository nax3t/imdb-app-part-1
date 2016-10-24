class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.text :plot
      t.string :imdb_id

      t.timestamps
    end
  end
end
