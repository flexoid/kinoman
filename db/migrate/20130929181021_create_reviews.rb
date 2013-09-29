class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :movie, index: true
      t.references :user, index: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
