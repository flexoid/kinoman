class SearchController < ApplicationController

  def movies
    movies = Movie.where("title ILIKE '%#{params[:q]}%'").limit(5).map do |movie|
      {
        title: movie.title,
        year: movie.year,
        url: movie_path(movie)
      }
    end
    render json: movies.to_json
  end

  def people
    people = Person.where("name ILIKE '%#{params[:q]}%'").limit(5).map do |person|
      {
        name: person.name,
        roles: person.all_roles,
        url: person_path(person)
      }
    end
    render json: people.to_json
  end
end
