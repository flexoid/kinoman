class MoviesController < ApplicationController
  load_resource

  def show
    @actors = @movie.actors.includes(:movie_people)
  end
end
