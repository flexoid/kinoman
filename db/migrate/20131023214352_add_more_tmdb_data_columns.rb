class AddMoreTmdbDataColumns < ActiveRecord::Migration
  def change
    add_column :movie_people, :tmdb_data, :json, default: {}
  end
end
