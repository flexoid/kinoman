class CreateFavoriteMovies < ActiveRecord::Migration
  def change
    create_table :favorite_movies do |t|
      t.references :movie, index: true
      t.references :user, index: true
      t.references :favorites_list, index: true

      t.timestamps
    end
  end
end
