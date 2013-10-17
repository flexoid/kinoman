class Admin::MoviesController < ApplicationController
  before_filter :new_movie, only: [:create]
  load_and_authorize_resource

  respond_to :html

  def new
  end

  def edit
  end

  def create
    @movie.save
    respond_with(@movie)
  end

  def update
    @movie.update_attributes(movie_params)
    respond_with(@movie)
  end

  def destroy
  end

  private

    def movie_params
      params.require(:movie).permit!
    end

    def new_movie
      @user = Movie.new(movie_params)
    end
end
