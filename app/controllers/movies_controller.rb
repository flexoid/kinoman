class MoviesController < ApplicationController
  load_resource

  def show
    @actors = @movie.actors.includes(:movie_people)
    @reviews = @movie.reviews.approved
    @grade = current_user.grade_for_movie(@movie) if current_user
  end
end
