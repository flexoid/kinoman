class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.references :user, index: true
      t.references :movie, index: true
      t.integer :value

      t.timestamps
    end
  end
end
