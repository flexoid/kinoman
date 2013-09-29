class MoviesController < ApplicationController
  load_resource

  def show
    @actors = @movie.actors.includes(:movie_people)
    @reviews = @movie.reviews
  end
end
