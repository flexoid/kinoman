class Actor < Person
  has_many :role, through: :movie_people
end
