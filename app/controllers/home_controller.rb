class HomeController < ApplicationController

  def index
    @people = Person.all.limit(50)
    @movies = Movie.all.limit(50)
  end
end
