## Kinoman

Movie Database site

Done as a course project in 2013.

### How to run

Create and run *db* containers:

    docker-compose up -d db

Prepare database:

    docker-compose run app rake db:create db:migrate db:seed

Run entire app:

    docker-compose up -d

Load some real movie data from the TMDB (optional):

    docker-compose run app rake load_from_tmdb
