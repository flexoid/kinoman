class CreateForumMessages < ActiveRecord::Migration
  def change
    create_table :forum_messages do |t|
      t.references :thread, index: true
      t.references :author, index: true
      t.text :content

      t.timestamps
    end
  end
end
