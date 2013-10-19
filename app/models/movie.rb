class Movie < ActiveRecord::Base
  include Discussible
  include ImageLoadable

  has_many :movie_people

  with_options through: :movie_people, source: :person do |assoc|
    assoc.has_many :actors, source_type: 'Actor'
    assoc.has_many :producers, source_type: 'Producer'
    assoc.has_many :directors, source_type: 'Director'
    assoc.has_many :composers, source_type: 'Composer'
  end

  has_and_belongs_to_many :countries
  has_and_belongs_to_many :genres

  has_many :reviews, dependent: :destroy
  has_many :grades, dependent: :destroy

  validates :title, presence: true

  has_attached_file :poster, styles: { show: '200x300>' }
  loadable_image :poster

  def grade
    (grades.average(:value) || 0).round(1).to_f
  end

  private

    def forum_category
      'Movies discussion'
    end

    def forum_thread_name
      title
    end
end
