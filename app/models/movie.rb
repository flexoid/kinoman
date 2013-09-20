class Movie < ActiveRecord::Base

  has_many :movie_people

  with_options through: :movie_people, source: :person do |assoc|
    assoc.has_many :actors, source_type: 'Actor'
    assoc.has_many :producers, source_type: 'Producer'
    assoc.has_many :directors, source_type: 'Director'
    assoc.has_many :composers, source_type: 'Composer'
  end

  has_and_belongs_to_many :countries
  has_and_belongs_to_many :genres

  validates :title, presence: true

  has_attached_file :poster, styles: { show: '200x300>' }
end
