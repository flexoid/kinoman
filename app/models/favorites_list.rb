class FavoritesList < ActiveRecord::Base
  belongs_to :user
  has_many :favorite_movies, dependent: :destroy
  has_many :movies, through: :favorite_movies

  validates :title, presence: true
  validates :user, presence: true, unless: :global?
  validates :title, uniqueness: {scope: :user_id}

  scope :global, -> { where(global: true) }

  def has_movie?(movie, user)
    favorite_movies.where(movie_id: movie, user_id: user).exists?
  end

  def add_movie(movie, user)
    favorite_movies.create(movie: movie, user: user)
  end

  def remove_movie(movie, user)
    favorite_movies.where(movie_id: movie, user_id: user).first.try(:destroy)
  end

  def movies_for_user(user)
    movies.where(['favorite_movies.user_id = ?', user.id])
  end
end
