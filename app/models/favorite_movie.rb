class FavoriteMovie < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  belongs_to :favorites_list

  validates :movie, :favorites_list, presence: true
  validates :user, presence: true, if: "favorites_list.try :global?"
  validates :movie_id, uniqueness: {scope: :favorites_list_id}
end
