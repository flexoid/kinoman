class GradesController < ApplicationController

  def rate
    @movie = Movie.find(params[:movie_id])
    @grade = current_user.grade_for_movie(@movie) || current_user.grades.build(movie: @movie)
    @grade.value = params[:value].to_i
    @grade.save!
  end
end
