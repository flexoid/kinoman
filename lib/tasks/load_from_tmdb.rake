task load_from_tmdb: :environment do

  module Tmdb
    class Search
      def fetch(options = {})
        fetch_response(options)['results']
      end

      def fetch_response(options = {})
        options = @params.merge(Api.config).merge(options)
        response = Api.get(@resource, :query => options, :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json' })
        response.to_hash
      end
    end
  end

  Tmdb::Api.key("349fc3c6431a7a9fff4cd8ff9b7dd268")

  movie_search = Tmdb::Search.new('/movie/popular')
  i = 0

  (1..2).each do |movie_page|
    movies = movie_search.fetch(page: movie_page)

    movies.each do |movie_short|
      i += 1
      puts "#{i}. #{movie_short['title']}"
      begin
        ActiveRecord::Base.transaction do

          movie_basic = Tmdb::Search.new("/movie/#{movie_short['id']}").fetch_response
          year = Date.parse(Tmdb::Search.new('/movie/100/releases').fetch_response['countries'][0]['release_date']).year

          movie = Movie.create!({
            title: movie_basic['title'],
            year: year,
            budget: movie_basic['budget'],
            duration: movie_basic['runtime']
          })

          movie_basic['production_countries'].each do |country_data|
            country = Country.where(title: country_data['name']).first_or_create!
            movie.countries << country
          end

          movie_basic['genres'].each do |genre_data|
            genre = Genre.where(title: genre_data['name']).first_or_create!
            movie.genres << genre
          end

          movie_people = Tmdb::Search.new("/movie/#{movie_short['id']}/casts").fetch_response

          movie_people['cast'].each do |cast|
            person = Person.where(name: cast['name']).first_or_create!
            movie.actors << person.becomes(Actor)
            movie.movie_people.where(person_id: person.id).first.create_role!(title: cast['character'])
          end

          crew_hash = {"Director" => Director, "Producer" => Producer, "Original Music Composer" => Composer}
          movie_people['crew'].each do |crew|
            if klass = crew_hash[crew['job']]
              person = Person.where(name: crew['name']).first_or_create!
              movie.public_send(klass.to_s.downcase.pluralize) << person.becomes(klass)
            end
          end

        end
      rescue => e
        puts "ERROR: #{e.inspect}"
      end
    end
  end
end
