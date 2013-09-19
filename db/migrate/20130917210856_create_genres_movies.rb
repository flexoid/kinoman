class CreateGenresMovies < ActiveRecord::Migration
  def change
    create_table :genres_movies do |t|
      t.references :movie, index: true
      t.references :genre, index: true
    end
  end
end
