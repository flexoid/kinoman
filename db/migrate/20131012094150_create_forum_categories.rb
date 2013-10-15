class CreateForumCategories < ActiveRecord::Migration
  def change
    create_table :forum_categories do |t|
      t.string :title

      t.timestamps
    end

    add_index :forum_categories, :title
  end
end
