class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title
      t.decimal :fee, precision: 18, scale: 4
      t.integer :movie_person_id

      t.timestamps
    end
  end
end
