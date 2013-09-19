class HomeController < ApplicationController

  def index
    @people = Person.all
    @movies = Movie.all
  end
end
