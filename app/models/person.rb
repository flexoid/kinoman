class Person < ActiveRecord::Base
  include Discussible
  include ImageLoadable

  has_many :movie_people
  has_many :movies, through: :movie_people

  validates :name, presence: true

  has_attached_file :photo, styles: { show: '200x300>' }
  loadable_image :photo

  def role_for_movie(movie)
    movie_people.where(movie: movie).pluck(:person_type).join(', ')
  end

  def all_roles
    movie_people.pluck('DISTINCT person_type').join(', ')
  end

  private

    def forum_category
      'People discussion'
    end

    def forum_thread_name
      name
    end
end
