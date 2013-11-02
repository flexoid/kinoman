class FavoritesListsController < ApplicationController
  respond_to :js
  before_action :load

  def add_movie
    @list.add_movie(@movie, current_user)
  end

  def remove_movie
    @list.remove_movie(@movie, current_user)
  end

  private

    def load
      @list = FavoritesList.find(params[:favorites_list_id])
      @movie = Movie.find(params[:movie_id])
    end
end
