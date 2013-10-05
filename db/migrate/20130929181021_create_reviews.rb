class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :movie, index: true
      t.references :user, index: true
      t.text :content
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
