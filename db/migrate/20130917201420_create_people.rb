class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :orig_name
      t.date :birthdate
      t.string :birthplace

      t.timestamps
    end
  end
end
