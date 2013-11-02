module FavoritesListsHelper

  def link_to_favorite_movie_action(list, movie)
    list_has_movie = list.has_movie?(movie, current_user)

    action = list_has_movie ? :remove_movie : :add_movie
    url = url_for(controller: 'favorites_lists', action: action, favorites_list_id: list, movie_id: movie)

    link_to url, method: :post, remote: true do
      ''.tap do |content|
        content.concat content_tag('span', '', class: 'glyphicon glyphicon-ok') + ' ' if list_has_movie
        content.concat list.title
      end.html_safe
    end
  end

end
