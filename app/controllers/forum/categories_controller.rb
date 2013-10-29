class Forum::CategoriesController < ApplicationController

  load_and_authorize_resource

  def index
  end

  def show
    @threads = @category.threads.paginate(page:params[:page])
  end
end
