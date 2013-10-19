class ChangeApiDataColumns < ActiveRecord::Migration
  def self.up
    remove_column :movies, :api_data
    remove_column :people, :api_data

    add_column :movies, :tmdb_data, :json, default: {}
    add_column :people, :tmdb_data, :json, default: {}
    add_column :countries, :tmdb_data, :json, default: {}
    add_column :genres, :tmdb_data, :json, default: {}
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
