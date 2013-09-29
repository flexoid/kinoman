class Admin::MoviesController < ApplicationController
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
end
