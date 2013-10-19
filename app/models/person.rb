class Person < ActiveRecord::Base
  include Discussible

  has_many :movie_people
  has_many :movies, through: :movie_people

  validates :name, presence: true

  has_attached_file :photo, styles: { show: '200x300>' }

  def role_for_movie(movie)
    movie_people.where(movie: movie).map(&:person_type).join(', ')
  end

  def photo_from_url(url)
    self.photo = open(url)
  end

  private

    def forum_category
      'People discussion'
    end

    def forum_thread_name
      name
    end
end
