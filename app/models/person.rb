class Person < ActiveRecord::Base

  has_many :movie_people
  has_many :movies, through: :movie_people

  validates :name, presence: true

  has_attached_file :photo, styles: { show: '200x300>' }

  def role_for_movie(movie)
    movie_people.where(movie: movie).map(&:person_type).join(', ')
  end

  private

    # def create_thread
end
