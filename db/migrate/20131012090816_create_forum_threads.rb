class CreateForumThreads < ActiveRecord::Migration
  def change
    create_table :forum_threads do |t|
      t.string :title
      t.references :author, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
