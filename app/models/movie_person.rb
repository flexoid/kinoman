class MoviePerson < ActiveRecord::Base
  belongs_to :movie
  belongs_to :person

  has_one :role
end
