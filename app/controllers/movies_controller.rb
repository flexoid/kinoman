class MoviesController < ApplicationController
  load_resource

  def show
    @actors = @movie.actors.order("(movie_people.tmdb_data->>'order')::int").includes(:movie_people)
    @reviews = @movie.reviews.approved
    @grade = current_user.grade_for_movie(@movie) if current_user
  end
end
