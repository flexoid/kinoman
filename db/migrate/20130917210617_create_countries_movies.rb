class CreateCountriesMovies < ActiveRecord::Migration
  def change
    create_table :countries_movies do |t|
      t.references :movie, index: true
      t.references :country, index: true
    end
  end
end
