class CreateGlobalFavoritesLists < ActiveRecord::Migration
  DEFAULT_LISTS = [
    'Favorites',
    'Want to buy',
    'Watch at TV'
  ]

  def up
    DEFAULT_LISTS.each do |list_name|
      FavoritesList.create(title: list_name, global: true)
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
