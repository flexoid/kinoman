class CreateFavoritesLists < ActiveRecord::Migration
  def change
    create_table :favorites_lists do |t|
      t.string :title
      t.references :user, index: true
      t.boolean :global, default: false

      t.timestamps
    end

    add_index :favorites_lists, :global
  end
end
