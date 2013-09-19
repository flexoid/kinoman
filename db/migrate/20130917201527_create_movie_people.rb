class CreateMoviePeople < ActiveRecord::Migration
  def change
    create_table :movie_people do |t|
      t.references :movie, index: true
      t.references :person, index: true
      t.string :person_type

      t.timestamps
    end
  end
end
