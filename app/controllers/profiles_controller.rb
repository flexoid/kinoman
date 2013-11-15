class ProfilesController < ApplicationController

  def show
  end

  def movies
    unless params[:list_id]
      redirect_to movies_profile_path(list_id: current_user.all_favorites_lists.first) and return
    end

    list = FavoritesList.find(params[:list_id])
    @movies = list.movies
  end
end
