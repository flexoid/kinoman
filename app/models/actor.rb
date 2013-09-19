class Actor < Person

  has_many :roles, through: :movie_people
end
