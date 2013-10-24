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

task load_from_tmdb: :environment do

  page_from = ENV['PAGE_FROM'].to_i
  page_from = 1 if page_from < 1
  page_to = ENV['PAGE_TO'].to_i
  page_to = page_from if page_to < 1

  Tmdb::Api.key("349fc3c6431a7a9fff4cd8ff9b7dd268")
  base_url = Tmdb::Configuration.new.base_url

  movie_search = Tmdb::Search.new('/movie/popular')
  i = 0

  (page_from..page_to).each do |movie_page|
    movies = movie_search.fetch(page: movie_page)

    movies.each do |movie_short|
      i += 1
      begin
        puts "#{i}. #{movie_short['title']}"
        ActiveRecord::Base.transaction do

          movie_basic = Tmdb::Search.new("/movie/#{movie_short['id']}").fetch_response
          year = Date.parse(Tmdb::Search.new("/movie/#{movie_short['id']}/releases").fetch_response['countries'][0]['release_date']).year

          movie = Movie.new({
            title: movie_basic['title'],
            year: year,
            budget: movie_basic['budget'],
            duration: movie_basic['runtime'],
            tmdb_data: movie_basic
          })

          movie.poster_from_url("#{base_url}/w342/#{movie_basic['poster_path']}", movie.title) if movie_basic['poster_path'].present?
          movie.save!

          movie_basic['production_countries'].each do |country_data|
            country = Country.where(title: country_data['name']).first_or_create!(tmdb_data: country_data)
            movie.countries << country
          end

          movie_basic['genres'].each do |genre_data|
            genre = Genre.where(title: genre_data['name']).first_or_create!(tmdb_data: genre_data)
            movie.genres << genre
          end

          movie_people = Tmdb::Search.new("/movie/#{movie_short['id']}/casts").fetch_response

          movie_people['cast'].each do |cast|
            person = Person.where(name: cast['name']).first_or_create!(tmdb_data: cast.slice('id'))
            mp = movie.movie_people.create!(person: person, person_type: 'Actor', tmdb_data: cast)
            mp.create_role!(title: cast['character'])
          end

          crew_hash = {"Director" => Director, "Producer" => Producer, "Original Music Composer" => Composer}
          movie_people['crew'].each do |crew|
            if klass = crew_hash[crew['job']]
              person = Person.where(name: crew['name']).first_or_create!(tmdb_data: crew.slice('id'))
              movie.movie_people.create!(person: person, person_type: klass.name, tmdb_data: crew)
            end
          end

        end
      rescue => e
        puts "ERROR: #{e.inspect}"
      end
    end
  end

  Person.where("(tmdb_data->>'adult')::boolean is null").each.with_index do |person, i|
    begin
      ActiveRecord::Base.transaction do
        puts "#{i + 1}. #{person.name}"

        person_data = Tmdb::Search.new("/person/#{person.tmdb_data['id']}").fetch_response
        birthdate = Date.parse(person_data['birthday']) rescue nil
        person.birthdate = birthdate if birthdate
        person.birthplace = person_data['place_of_birth'] if person_data['place_of_birth'].present?
        person.photo_from_url("#{base_url}/h632/#{person_data['profile_path']}", person.name) if person_data['profile_path'].present?
        person.tmdb_data = person.tmdb_data.merge(person_data)

        person.save!
      end
    rescue => e
      puts "ERROR: #{e.inspect}"
    end
  end
end
