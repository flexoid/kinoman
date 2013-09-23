class Person < ActiveRecord::Base

  has_many :movie_people
  has_many :movies, through: :movie_people

  validates :name, presence: true

  has_attached_file :photo, styles: { show: '200x300>' }
end
