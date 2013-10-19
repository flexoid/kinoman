class AddApiDataToMoviesAndPeople < ActiveRecord::Migration
  def change
    add_column :movies, :api_data, :json, default: {}
    add_column :people, :api_data, :json, default: {}
  end
end
