class FavoritesList < ActiveRecord::Base
  belongs_to :user
  has_many :favorite_movies, dependent: :destroy

  validates :title, presence: true
  validates :user, presence: true, unless: :global?
  validates :title, uniqueness: {scope: :user_id}

  scope :global, -> { where(global: true) }

  def has_movie?(movie)
    favorite_movies.where(movie_id: movie).exists?
  end
end
