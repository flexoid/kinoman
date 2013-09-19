class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :orig_title
      t.integer :year
      t.decimal :budget, precision: 18, scale: 4
      t.string :rating
      t.integer :duration

      t.timestamps
    end
  end
end
