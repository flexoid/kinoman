class HomeController < ApplicationController

  def index
    limit = 20

    @movies = Movie.where('poster_file_name IS NOT NULL')
    offset = rand(0...@movies.count-limit)
    @movies = @movies.offset(offset).limit(limit)

    @people = Person.where('photo_file_name IS NOT NULL')
    offset = rand(0...@people.count-limit)
    @people = @people.offset(offset).limit(limit)
  end
end
