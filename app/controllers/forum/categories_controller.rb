class Forum::CategoriesController < ApplicationController

  load_and_authorize_resource
  before_action :add_forum_breadcrumb

  def index
  end

  def show
    add_breadcrumb(@category.title, forum_root_path)
    @threads = @category.threads.paginate(page:params[:page])
  end

  private

    def add_forum_breadcrumb
      add_breadcrumb('Forum', forum_root_path)
    end
end
