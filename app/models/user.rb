class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_favorite_lists

  GUEST = 'guest'
  USER  = 'user'
  ADMIN = 'admin'
  ROLES = [GUEST, USER, ADMIN]

  validates :role, inclusion: {in: ROLES}
  validates :username, presence: true, uniqueness: true

  has_many :grades, dependent: :destroy
  has_many :favorites_lists, dependent: :destroy

  has_many :forum_threads, class_name: 'Forum::Thread', foreign_key: 'author_id'
  has_many :forum_messages, class_name: 'Forum::Message', foreign_key: 'author_id'

  before_create do
    self.role = USER
  end

  def grade_for_movie(movie)
    grades.where(movie_id: movie.id).first
  end

  def create_favorite_lists
    favorites_lists.create(title: 'Favorites')
  end

  def all_favorites_lists
    t = FavoritesList.arel_table
    FavoritesList.where(t[:user_id].eq(id).or(t[:global].eq(true)))
  end
end
