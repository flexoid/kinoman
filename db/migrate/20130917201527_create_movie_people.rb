class CreateMoviePeople < ActiveRecord::Migration
  def change
    create_table :movie_people do |t|
      t.references :movie, index: true
      t.references :person, index: true

      t.timestamps
    end
  end
end
