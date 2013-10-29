class SearchController < ApplicationController

  def movies
    movies = Movie.where("title ILIKE '%#{params[:q]}%'").limit(5).map do |movie|
      {
        title: movie.title,
        url: movie_path(movie)
      }
    end
    render json: movies.to_json
  end

  def people
    people = Person.where("name ILIKE '%#{params[:q]}%'").limit(5).map do |person|
      {
        name: person.name,
        url: person_path(person)
      }
    end
    render json: people.to_json
  end
end
