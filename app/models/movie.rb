class Movie < ActiveRecord::Base

  has_many :movie_people

  with_options through: :movie_people, source: :person do |assoc|
    assoc.has_many :actors, class_name: 'Actor'
    assoc.has_many :directors, class_name: 'Director'
    assoc.has_many :producers, class_name: 'Producer'
    assoc.has_many :composers, class_name: 'Composer'
  end

  has_and_belongs_to_many :countries
  has_and_belongs_to_many :genres

  validates :title, presence: true

end
